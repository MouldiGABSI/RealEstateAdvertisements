//
//  AdvertisementListService.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 12/02/2021.
//

import Foundation


protocol AdvertisementListServiceProtocol {
    func fetchAdvertisementsList(completion: @escaping (Result<Advertisements, APIError>) -> Void)
}

struct AdvertisementListAPIService: AdvertisementListServiceProtocol {
    func fetchAdvertisementsList(completion: @escaping (Result<Advertisements, APIError>) -> Void) {
        let router = APIRouter<APIAdvertisementService>()
        router.request(.getAdvertisementList, completion: completion)
    }
}

struct MockAdvertisementRouter: APIProtocol {
    var jsonFileName: String?
}

struct MockAdvertisementListAPIService: AdvertisementListServiceProtocol {
    var fileName: String
    func fetchAdvertisementsList(completion: @escaping (Result<Advertisements, APIError>) -> Void) {
        let router = APIRouter<MockAdvertisementRouter>()
        router.request(MockAdvertisementRouter(jsonFileName: fileName), completion: completion)
    }

}
