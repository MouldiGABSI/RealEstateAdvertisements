//
//  AdvertisementListConfigurator.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 12/02/2021.
//

import Foundation
import UIKit

final class AdvertisementListConfigurator {


    // MARK: - Singleton

    static let shared: AdvertisementListConfigurator = AdvertisementListConfigurator()


    // MARK: - Configuration

    func configure(viewController: AdvertisementListViewController) {

        let service = AdvertisementListAPIService()
        let dataSource = AdvertisementListDataSource()
        var viewModel  = AdvertisementListViewModel(dataSource: dataSource)
        viewController.dataSource = dataSource
        viewModel.service = service
        viewController.viewModel = viewModel
        
    }
}
