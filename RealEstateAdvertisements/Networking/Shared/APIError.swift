//
//  APIError.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 12/02/2021.
//

import Foundation

public struct APIError: Error, CustomStringConvertible {
    
    public enum ErrorType {
        
        case networkFailure
        case cannotFetch
        case notFound
        case emptyData
        case requestFailed
        case objectMapping
        case authenticationRequired
        case badRequest
        case serverError
       
    }
    
    let type: ErrorType
    let message: String
    let code: Int
    
    public init(type: ErrorType, message: String, code: Int = 0) {
        self.type = type
        self.message = message
        self.code = code
    }
    
    public var description: String {
        return self.message
    }
}
