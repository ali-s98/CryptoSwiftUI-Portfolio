//
//  City.swift
//  Vezarat_Moje
//
//  Created by ali sadeghi on 28/09/1401 AP.
//

import Foundation

public enum CoinImageApi{
   
    case coinImage(path: String)
   
}

extension CoinImageApi: EndPointType{
    
    var baseUrl: String {
        switch self {
        case .coinImage(let path):
            return path
        }
    }
    
    var path: String {
       return ""
    }
    
    var httpMethod: HTTPMethod {
       
        switch self {

        case .coinImage:
            return .GET
        }
    }
    
    var Task: HTTPTask {
        
        return .none
    }
    
    var httpheader: HTTPHeaders? {
        return .application_json(enviroment: .Base)

    }
}
