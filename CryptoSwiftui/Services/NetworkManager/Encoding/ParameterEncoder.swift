//
//  ParameterEncoder.swift

import Foundation


public struct ParameterEncoder : Encoderr {
    
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters?, media: [Media]?) throws {
        guard let url = urlRequest.url else { throw NetworkError.missingURL}
        guard let parameters = parameters else { throw NetworkError.parametersNil}

        if var urlComponenets = URLComponents(url: url, resolvingAgainstBaseURL: false) ,
           !parameters.isEmpty{
           
            urlComponenets.queryItems = [URLQueryItem]()
            for (key , value) in parameters{
                if value != nil{
                        let queryitem = URLQueryItem(name: key, value : "\(value!)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
                        urlComponenets.queryItems?.append(queryitem)
                    
                }
            }
            
         
            urlComponenets.percentEncodedQuery = urlComponenets.percentEncodedQuery?
                .replacingOccurrences(of: "%25", with: "%")
            urlRequest.url = urlComponenets.url
        }
        
    }
}


