//
//  City.swift
//  Vezarat_Moje
//
//  Created by ali sadeghi on 28/09/1401 AP.
//

import Foundation



public enum CoinApi{
   
    case allCoins(vs_currency: String,
                  order: String,
                  per_page: Int,
                  page: Int,
                  sparkline: Bool,
                  price_change_percentage: String)
    
    case detail(id: String,
                localization: String,
                tickers: Bool,
                market_data: Bool,
                community_data: Bool,
                developer_data: Bool,
                sparkline: Bool)
   
}

extension CoinApi: EndPointType{
    
    var baseUrl: String {
        return Enviroment.Base.baseUrl + "/coins"
    }
    
    var path: String {
        switch self {
        case .allCoins:
            return "/markets"
            
        case .detail(let id):
            return "/\(id)"
            
        }
    }
    
    var httpMethod: HTTPMethod {
       
        switch self {

        case .allCoins , .detail:
            return .GET
        
        }
    }
    
    var Task: HTTPTask {
        
        switch self {
            
        case .allCoins(let vs_currency, let order, let per_page, let page, let sparkline, let price_change_percentage):
            
            let queryParameter = ["vs_currency": vs_currency, "order": order, "per_page": per_page, "page": page, "sparkline": sparkline, "price_change_percentage": price_change_percentage] as [String : Any]
            return .requestParameters(urlParameters: queryParameter, jsonbody: nil, encoding: .parameterEncoding)
            
        case .detail( _, let localization, let tickers, let market_data, let community_data, let developer_data, let sparkline):
            let queryParameter = ["localization": localization, "tickers": tickers, "market_data": market_data, "community_data": community_data, "developer_data": developer_data, "sparkline": sparkline] as [String : Any]
            return .requestParameters(urlParameters: queryParameter, jsonbody: nil, encoding: .parameterEncoding)
            
        }
        
    }
    
    var httpheader: HTTPHeaders? {
        return .application_json(enviroment: .Base)

    }
}
