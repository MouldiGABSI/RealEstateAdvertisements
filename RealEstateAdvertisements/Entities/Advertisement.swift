//
//  Advertisement.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 12/02/2021.
//

import Foundation

struct Advertisement: Codable {
    var bedrooms : Int?
    var city: String
    var advertisementId: Int
    var area: Double
    var iconURL : String?
    var price: Double
    var professional: String
    var propertyType: String
    var rooms: Int?
    
    enum CodingKeys: String, CodingKey {
        case advertisementId   = "id"
        case iconURL = "url"
        case bedrooms, city, area, price, professional, propertyType, rooms
    }
}

struct Advertisements : Codable {
    var items: [Advertisement]
    var totalCount: Int
    
    enum CodingKeys: String, CodingKey {
        case items, totalCount
    }
}


/*
 
 {
   "items": [{
       "bedrooms": 4,
       "city": "Villers-sur-Mer",
       "id": 1,
       "area": 250.0,
       "url": "https://v.seloger.com/s/crop/590x330/visuels/1/7/t/3/17t3fitclms3bzwv8qshbyzh9dw32e9l0p0udr80k.jpg",
       "price": 1500000.0,
       "professional": "GSL EXPLORE",
       "propertyType": "Maison - Villa",
       "rooms": 8
   },
   {
       "bedrooms": 7,
       "city": "Deauville",
       "id": 2,
       "area": 600.0,
       "url": "https://v.seloger.com/s/crop/590x330/visuels/2/a/l/s/2als8bgr8sd2vezcpsj988mse4olspi5rfzpadqok.jpg",
       "price": 3500000.0,
       "professional": "GSL STICKINESS",
       "propertyType": "Maison - Villa",
       "rooms": 11
   },
   {
       "city": "Bordeaux",
       "id": 3,
       "area": 550.0,
       "price": 3000000.0,
       "professional": "GSL OWNERS",
       "propertyType": "Maison - Villa",
       "rooms": 7
   },
   {
       "city": "Nice",
       "id": 4,
       "area": 250.0,
       "url": "https://v.seloger.com/s/crop/590x330/visuels/1/9/f/x/19fx7n4og970dhf186925d7lrxv0djttlj5k9dbv8.jpg",
       "price": 5000000.0,
       "professional": "GSL CONTACTING",
       "propertyType": "Maison - Villa"
   }],
   "totalCount": 4
 }
 
 */
