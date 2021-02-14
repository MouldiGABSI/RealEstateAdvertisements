//
//  APIQueryParam.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 12/02/2021.
//

import Foundation

public struct APIQueryParam {
    let key: String
    let value: Any?
    
    init(key: String, value: AnyObject?) {
        self.key = key
        self.value = value
    }
}

extension APIQueryParam: Equatable {}

public func ==(lhs: APIQueryParam, rhs: APIQueryParam) -> Bool {
    return lhs.key == rhs.key
}

// operator to create fast APIQueryParam by: "key" ~> theValue
infix operator ~>
public func ~>(left: String, right: Any) -> APIQueryParam {
    return APIQueryParam(key: left, value: right as AnyObject)
}
