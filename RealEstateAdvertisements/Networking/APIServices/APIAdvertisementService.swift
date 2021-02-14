//
//  APIAdvertisementService.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 12/02/2021.
//

import Foundation


public enum APIAdvertisementService {
    case getAdvertisementList
    case getAdvertisementById(Id: Int)
}

extension MockAPIProtocol {
    public var jsonFileName : String? { return nil }
}

extension APIAdvertisementService: APIProtocol {
    
    var urlString: String {
        switch APIConfig.shared.environment {
        case .prod: return APIConfig.shared.scheme.rawValue + APIConfig.shared.baseUrl
        case .dev: return APIConfig.shared.scheme.rawValue + APIConfig.shared.baseUrl
        }
    }
    
    public var baseURL: URL? {
        guard let url = URL(string: urlString) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    public var path: String? {
        switch self {
        case .getAdvertisementList:
           return "/listings.json"
        case .getAdvertisementById(let Id):
            return "/listings/\(Id).json"
        }

    }
    public var httpMethod: HttpMethod? {
        return .get
    }
    
    public var task: HTTPTask? {
        return .request
    }
    
    public var headers: HTTPHeaders? {
        return nil
    }
}
