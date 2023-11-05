//
//  City.swift
//  Vezarat_Moje
//
//  Created by ali sadeghi on 28/09/1401 AP.
//

import Foundation



public enum MarketApi{
   
    case globalMarket
   
}

extension MarketApi: EndPointType{
    
    var baseUrl: String {
        return Enviroment.Base.baseUrl
    }
    
    var path: String {
        return "/global"
    }
    
    var httpMethod: HTTPMethod {
       
        switch self {

        case .globalMarket:
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
