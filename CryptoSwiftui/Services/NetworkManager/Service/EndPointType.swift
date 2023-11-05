//
//  EndPointType.swift
// 
//

import Foundation



protocol EndPointType {
    
    var baseUrl : String {get}
    var path : String {get}
    var httpMethod : HTTPMethod {get}
    var Task : HTTPTask{get}
    var httpheader : HTTPHeaders?{get}
    
}

protocol EnviromentType {
    
    var baseUrl : String {get}
    var token : String {get}    
}
