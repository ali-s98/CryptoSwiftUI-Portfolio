//
//  NetworkManager.swift
//
//

import Foundation
import Combine
import UIKit

protocol NetworkRouter {
    func fetchData<T : Decodable>(endPoint : EndPointType ) -> AnyPublisher<T,APIError>
    func fetch(endPoint : EndPointType) -> AnyPublisher<Data,APIError>
    func cancle()
}




class NetworkManager: NetworkRouter{
    

    private var task: URLSessionTask?
    static let shared = NetworkManager()
    
    func fetchData<T : Decodable>(endPoint : EndPointType) -> AnyPublisher<T,APIError> {
        request(endPoint)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError(handleError(error:))
            .eraseToAnyPublisher()
    }
    
    func fetch(endPoint : EndPointType) -> AnyPublisher<Data,APIError> {
        request(endPoint)
            .eraseToAnyPublisher()
    }
    
   
    //==========================================================================
    
  private func request(_ router: EndPointType) -> AnyPublisher<Data,APIError> {

      let request =  self.buildRequest(from: router)

      return URLSession.shared
          .dataTaskPublisher(for: request!)
          .subscribe(on: DispatchQueue.global(qos: .default))
          .tryMap( handleUrlResponse(output:))
          .mapError(handleError(error:))
          .receive(on: RunLoop.main)
          .eraseToAnyPublisher()
      
    
        }
    
  
    //==========================================================================
    
    func cancle() {
        self.task?.cancel()
        
    }
    
    //==========================================================================

    func buildRequest(from router : EndPointType) ->URLRequest?{
        guard var url = URL(string: router.baseUrl) else {fatalError("baseURL could not be configured.")}
      
        if router.path.count >= 1 {
            url = url.appendingPathComponent(router.path )
        }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        request.httpMethod = router.httpMethod.rawValue
         
        addHeaders(router.httpheader, request: &request)
    

        do {
            switch router.Task{
            case .none:
            break
            case .requestParameters(let urlParameters ,let  jsonbody,let  encoding):
            
                try self.configureParameters(encoding: encoding, bodyParameters: jsonbody, urlParameters: urlParameters, jsonObject: nil, media: nil, request: &request)

            case .request(let jsonbody):
                try self.configureParameters(encoding: .JsonObjecEncoding, bodyParameters: nil, urlParameters: nil, jsonObject: jsonbody, media: nil, request: &request)

            case .requestFormData(let jsonbody, let media):

                try self.configureParameters(encoding: .multipartformData, bodyParameters: jsonbody, urlParameters: nil, jsonObject: nil, media: media, request: &request)
                
            }
    
            return request
        }catch{
            print(error.localizedDescription)
            return nil
        }

    }
    //==========================================================================

    private func handleUrlResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data{
        
        guard let httpresponse = output.response as? HTTPURLResponse else {
            throw APIError.unknown
        }
        
        guard httpresponse.statusCode >= 200 && httpresponse.statusCode < 300 else {
            let errorMessage = ErrorMessage(with: output.data) ?? "informational statuscode\(httpresponse.statusCode)"
            throw APIError.apiError(reason: errorMessage)
            
        }
        return output.data
        
    }
    
    //==========================================================================

    private func configureParameters(encoding : ParameterEncoding ,bodyParameters: Parameters?, urlParameters: Parameters?,jsonObject: Data?, media: [Media]?,request: inout URLRequest) throws{

        do{
            try  encoding.encode(urlRequest: &request, urlParameters: urlParameters, bodyParameters: bodyParameters, jsonObject: jsonObject, media: media)
        }catch{
            throw error
        }
    }
    
    //============================================================================
    
    private func addHeaders(_ addHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = addHeaders else { return }
        let headerParameter = headers.headerInfo

        for (key, value) in headerParameter! {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    //==========================================================================
    
    private func ErrorMessage(with data : Data)->String?{
        do{
            let error = try JSONDecoder().decode(ErrorModel.self, from: data)
            return error.status.message
        }catch{
            print(error.localizedDescription)
            return nil
            
        }
    }
    
    //==========================================================================

    
    static func handleCompleition(compleition: Subscribers.Completion<APIError>){
        switch compleition {
        case .failure(let error):
            print(error)
        case .finished :
            break
        }
    }
    
    //==========================================================================
    
    private func handleError(error: Publishers.TryMap<Publishers.SubscribeOn<URLSession.DataTaskPublisher, DispatchQueue>, Data>.Failure )-> APIError{
        if let error = error as? APIError {
            return error
        } else {
            return APIError.apiError(reason: error.localizedDescription)
        }
    }
    
}


