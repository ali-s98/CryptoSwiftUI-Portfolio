//
//  ApiData.swift
//  CryptoSwiftui
//
//  Created by ali sadeghi on 02/08/1402 AP.
//

import Foundation


struct ApiData<T: Decodable>: Decodable{
    var data: T
}
