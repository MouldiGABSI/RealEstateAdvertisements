//
//  AdvertisementDetailsConfigurator.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 14/02/2021.
//

import Foundation


final class AdvertisementDetailsConfigurator {


    // MARK: - Singleton

    static let shared: AdvertisementDetailsConfigurator = AdvertisementDetailsConfigurator()


    // MARK: - Configuration

    func configure(viewController: AdvertisementDetailsViewController) {

        let service              = AdvertisementDetailsService()
        let viewModel            = AdvertisementDetailsViewModel()
        viewModel.service        = service
        viewController.viewModel = viewModel
    }
}
