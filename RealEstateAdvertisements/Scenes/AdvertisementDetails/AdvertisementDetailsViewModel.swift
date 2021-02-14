//
//  AdvertisementDetailsViewModel.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 14/02/2021.
//

import Foundation

protocol ObservableDetailsViewModelProtocol {
    func fetchAdvertisementDetails(advertisementId: Int)
    func setError(_ message: String)
    var advertisement: Observable<AdvertisementDetailsUIModel?> { get  set }
    var errorMessage: Observable<String?> { get set }
    var error: Observable<Bool> { get set }
}

class AdvertisementDetailsViewModel : ObservableDetailsViewModelProtocol {
    
    var errorMessage: Observable<String?> = Observable(nil)
    var error: Observable<Bool> = Observable(false)
    
    var service: AdvertisementDetailsServiceProtocol?
    var advertisement: Observable<AdvertisementDetailsUIModel?> = Observable(nil)
    
    init() {}
    
    func setError(_ message: String) {
        self.errorMessage.value = message
        self.error.value  = true
    }
    
    func fetchAdvertisementDetails(advertisementId: Int) {
        service?.fetchAdvertisementDetails(advertisementId: advertisementId, completion: { (result:Result<Advertisement, APIError>) in
            switch result {
            case .success(let _advertisement) :
                let detailsWorker = AdvertisementDetailsWorker()
                let detailsUIViewModel = detailsWorker.generateDetailsViewModel(advertisement: _advertisement)
                self.advertisement.value = detailsUIViewModel
            case .failure(let error):
                print("-----> \(error)")
                self.setError(error.message)
            }
        })
    }
}

struct AdvertisementDetailsUIModel {
    var iconURL: URL?
    var propertyType: String?
    var roomsArea: String?
    var priceString: String?
    var city: String?
    var professional: String?
}
