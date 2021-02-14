//
//  AdvertisementDetailsService.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 14/02/2021.
//

import Foundation



protocol AdvertisementDetailsServiceProtocol {
    func fetchAdvertisementDetails(advertisementId: Int, completion: @escaping (Result<Advertisement, APIError>) -> Void)
}

struct AdvertisementDetailsService: AdvertisementDetailsServiceProtocol {
    func fetchAdvertisementDetails(advertisementId: Int, completion: @escaping (Result<Advertisement, APIError>) -> Void) {
        let router = APIRouter<APIAdvertisementService>()
        router.request(.getAdvertisementById(Id: advertisementId), completion: completion)
    }
}

struct MockAdvertisementDetailsAPIService: AdvertisementDetailsServiceProtocol {
    var fileName: String
    func fetchAdvertisementDetails(advertisementId: Int, completion: @escaping (Result<Advertisement, APIError>) -> Void) {
        let router = APIRouter<MockAdvertisementRouter>()
        router.request(MockAdvertisementRouter(jsonFileName: fileName), completion: completion)
    }

}
