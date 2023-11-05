//
//  Data.swift
//  CryptoSwiftui
//
//  Created by ali sadeghi on 30/07/1402 AP.
//

import Foundation


extension Data {
   mutating func appendValue(_ string: String) {
      if let data = string.data(using: .utf8) {
         append(data)
      }
   }
}
