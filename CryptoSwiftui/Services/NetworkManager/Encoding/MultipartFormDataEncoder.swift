//
//  MultipartFormDataEncoder.swift
//  Doctore
//
//  Created by ali sadeghi on 11/26/1400 AP.
//

import Foundation

public struct FormDataEncoder: Encoderr {
    
    
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters?, media: [Media]?) throws {
        guard let _ = urlRequest.url else { throw NetworkError.missingURL}
        
        let jsonAsData = createDataBody(withParameters: parameters, media: media)
        
        urlRequest.httpBody = jsonAsData
        
    }
    
    
    
    private func createDataBody(withParameters params: Parameters?, media: [Media]?) -> Data {
        
        let lineBreak = "\r\n"
        var body = Data()

        if let parameters = params {
            for (key, value) in parameters {
                if value != nil{
                    if (value as Any) is Array<Any>{
                        let arrayObj = value as! Array<Any>
                        let count : Int  = arrayObj.count
                        for i in 0  ..< count
                        {
                            let value = arrayObj[i]
                            let keyObj = key
                            body.appendValue("--\(generateBoundary + lineBreak)")
                            body.appendValue("Content-Disposition: form-data; name=\"\(keyObj)\"\(lineBreak + lineBreak)")
                            body.appendValue("\(value)")
                            body.appendValue(lineBreak)
                        }
                        
                    }else{
                        body.appendValue("--\(generateBoundary + lineBreak)")
                        body.appendValue("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
                        body.appendValue("\(value!)")
                        body.appendValue(lineBreak)

                    }

                }
            }
        }
        
        
        

        if let media = media {
            for photo in media {
                body.appendValue("--\(generateBoundary + lineBreak)")
                body.appendValue("Content-Disposition: form-data; name=\"\(photo.key)\"; filename=\"\(photo.filename)\"\(lineBreak)")
                body.appendValue("Content-Type: \(photo.mimeType + lineBreak + lineBreak)")
                body.append(photo.data)
                body.appendValue(lineBreak)
            }
        }
        body.appendValue("--\(generateBoundary)--\(lineBreak)")

        

        return body
    }
    
    
    
    
}




