//
//  AdvertisementDetailsWorker.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 14/02/2021.
//

import Foundation

class AdvertisementDetailsWorker {
    
    /**
     This method will do a single work
     Called from the interactor
     */
    func generateDetailsViewModel(advertisement: Advertisement) -> AdvertisementDetailsUIModel {
        var roomsArea = ""
        if let rooms = advertisement.rooms {
            roomsArea += "\(rooms)p \u{00B7} "
        }
        if let bedrooms = advertisement.bedrooms {
            roomsArea += "\(bedrooms)ch \u{00B7} "
        }
        roomsArea += "\(advertisement.area) m\u{00B2}"
        var iconURL: URL? = nil
        if let _urlString = advertisement.iconURL {
            iconURL = URL(string: _urlString)
        }
        return AdvertisementDetailsUIModel(iconURL: iconURL, propertyType: advertisement.propertyType, roomsArea: roomsArea, priceString: advertisement.price.asLocaleCurrency, city: advertisement.city, professional: advertisement.professional)
        
    }
}
