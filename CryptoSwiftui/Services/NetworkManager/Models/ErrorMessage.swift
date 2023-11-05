//
//  ErrorMessage.swift
//  CryptoSwiftui
//
//  Created by ali sadeghi on 30/07/1402 AP.
//

import Foundation


struct ErrorModel: Decodable{
    let status: Status
    
    
}

struct Status: Decodable{
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case message = "error_message"
    }
}
