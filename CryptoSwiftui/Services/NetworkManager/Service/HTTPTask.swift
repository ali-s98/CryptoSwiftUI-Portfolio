//
//  HTTPTask.swift
//  Doctore_test
//
//  Created by Ali on 3/12/21.
//

import Foundation
public typealias Parameters = [String : Any?]

enum Enviroment{
    case Base
}


extension Enviroment: EnviromentType{
   
    var token: String{
        switch self {
        case .Base:
            return ""
        }
    }
    
    var baseUrl: String {
        switch self {
        case .Base:
            return "https://api.coingecko.com/api/v3e"
        }
    }
    
}

var generateBoundary: String {
    return "Boundary-244AEB3B-4E9D-436C-865B-1F0F9114E57C"
}

enum HTTPHeaders {
    case application_json(enviroment: Enviroment)
    case multiPartForm(enviroment: Enviroment)
    case application_stream(enviroment: Enviroment)
    
    var headerInfo: [String:String]?{
        switch self {
        case .application_json( _):
            return [
                "Content-Type" : "application/json" ]
        case .multiPartForm(let enviroment):
            return [
                "Content-Type" : "multipart/form-data; boundary=\(generateBoundary)",
                "Authorization" :  enviroment.token
            ]
            
        case .application_stream(let enviroment):
            return [
                "Content-Type" : "application/octet-stream",
                "Authorization" :  enviroment.token
            ]
        }
    }
}



public enum HTTPTask {
    
    case none
    case requestParameters(urlParameters: Parameters?,
                           jsonbody: Parameters? , encoding: ParameterEncoding)
    case requestFormData(jsonbody: Parameters?, media: [Media]?)
    case request(jsonObject: Data)

}
