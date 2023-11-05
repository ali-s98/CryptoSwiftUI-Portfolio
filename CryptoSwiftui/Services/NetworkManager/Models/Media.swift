//
//  Media.swift
//  Doctore
//
//  Created by ali sadeghi on 11/26/1400 AP.
//

import Foundation

public struct Media {
    let key: String
    let filename: String
    let data: Data
    let mimeType: String
    
    init?(withImage imagData: Data, forKey key: String, fileName: String, mimeType: String?) {
        self.key = key
        self.mimeType = mimeType ?? "image/jpeg"
        self.filename = fileName
        self.data = imagData
    }
    
}

