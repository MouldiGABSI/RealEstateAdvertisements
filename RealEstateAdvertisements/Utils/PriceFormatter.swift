//
//  PriceFormatter.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 12/02/2021.
//

import Foundation

extension Double {
    var asLocaleCurrency: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.init(identifier: "Fr-fr")
        return formatter.string(from: NSNumber(value: self))
    }
}
