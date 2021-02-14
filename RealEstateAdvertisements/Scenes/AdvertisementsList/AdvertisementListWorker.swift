//
//  AdvertisementListWorker.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 12/02/2021.
//

import Foundation

/// Class AdvertisementListWorker
///
/// Will perfom all the work requested by the viewModel
///
class AdvertisementListWorker {
    
    /**
     This method will do a single work
     Called from the interactor
     */
    func generateSectionsViewModel(advertisements: [Advertisement]) -> [TableSectionViewModel] {
        
        let rows = advertisements.map { (advertisement) -> AdvertisementRowViewModel in
            var roomsArea = ""
            if let rooms = advertisement.rooms {
                roomsArea += "\(rooms)p \u{00B7} "
            }
            if let bedrooms = advertisement.bedrooms {
                roomsArea += "\(bedrooms)ch \u{00B7} "
            }
            roomsArea += "\(advertisement.area) m\u{00B2}"
            
            return AdvertisementRowViewModel(iconURL: advertisement.iconURL, category: advertisement.propertyType, price: advertisement.price, city: advertisement.city, roomsArea: roomsArea)
        }
        let sections = rows.count > 0 ? [AdvertisementsSectionViewModel(dataModel: rows)] : []
        return sections
    }
}
