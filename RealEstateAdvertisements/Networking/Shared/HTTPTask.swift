//
//  HTTPTask.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 12/02/2021.
//

import Foundation

public typealias HTTPHeaders = [String:String]

 public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: [APIQueryParam]?,
        bodyEncoding: ParameterEncoding,
        urlParameters: [APIQueryParam]?)
    
    case requestParametersAndHeaders(bodyParameters: [APIQueryParam]?,
        bodyEncoding: ParameterEncoding,
        urlParameters: [APIQueryParam]?,
        additionHeaders: HTTPHeaders?)
    
    // case download, upload...etc
}
