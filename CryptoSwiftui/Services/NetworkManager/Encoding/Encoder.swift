
//
//  Encoder.swift
//
//

import Foundation



public protocol Encoderr {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters?, media: [Media]?) throws
}



public enum ParameterEncoding {
    
    case parameterEncoding
    case jsonEncoding
    case parameterAndJsonEncoding
    case JsonObjecEncoding
    case multipartformData


    func encode(urlRequest : inout URLRequest , urlParameters : Parameters?, bodyParameters : Parameters?, jsonObject: Data?, media: [Media]?) throws {
        
     
        do{
            switch self {
            case .parameterEncoding:
                guard let urlParameter = urlParameters else { throw NetworkError.parametersNil}
                try ParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameter, media: nil)

            case .jsonEncoding:
                guard let bodyParameter = bodyParameters else { throw NetworkError.parametersNil}
                try JsonEncoder().encode(urlRequest: &urlRequest, with: bodyParameter, media: nil)
                
            case .parameterAndJsonEncoding:
                guard let bodyParameters = bodyParameters,
                    let urlParameters = urlParameters else { throw NetworkError.parametersNil }
                try ParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters, media: nil)
                try JsonEncoder().encode(urlRequest: &urlRequest, with: bodyParameters, media: nil)
            
            case .JsonObjecEncoding:
                guard let jsonObject = jsonObject else { throw NetworkError.parametersNil}
                try JsonEncoder().encodeObject(urlRequest: &urlRequest, with: jsonObject)
                
            case .multipartformData:
                try FormDataEncoder().encode(urlRequest: &urlRequest, with: bodyParameters, media: media)
                
            }
               
       
            
            
        }catch{throw NetworkError.encodingFailed}
                
    }

}

public enum NetworkError : String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
}
