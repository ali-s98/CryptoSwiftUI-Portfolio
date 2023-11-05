//
//  ApiError.swift
//  ProTick
//
//  Created by ali sadeghi on 9/15/1400 AP.
//

import Foundation


enum APIError: Error, LocalizedError {
    case unknown
    case apiError(reason: String)
    case TimeOut
    case LostNetworkConction

    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .apiError(let reason):
            return reason
        case .TimeOut:
            return "failaur connection to the server"
        case .LostNetworkConction:
            return "check the internet connection"
        
        }
    }
}
