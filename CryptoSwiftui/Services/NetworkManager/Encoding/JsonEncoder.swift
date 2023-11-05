//
//  JsonEncoder.swift
//
//

import Foundation
import UIKit


public struct JsonEncoder: Encoderr {
    
   
    
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters?, media: [Media]?) throws {
        guard let _ = urlRequest.url else { throw NetworkError.missingURL}
        guard let parameters = parameters else { throw NetworkError.parametersNil}

        do{
            let jsonAsData =  try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            print(jsonAsData)
            urlRequest.httpBody = jsonAsData
            
        }catch{
            throw NetworkError.encodingFailed
        }
    }
    
    
    public func encodeObject(urlRequest: inout URLRequest, with parameters: Data) throws {
        guard let _ = urlRequest.url else { throw NetworkError.missingURL}
        
         urlRequest.httpBody = parameters
    }

}

