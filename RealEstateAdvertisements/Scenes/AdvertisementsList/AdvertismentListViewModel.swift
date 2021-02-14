//
//  AdvertismentListViewModel.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 12/02/2021.
//

import Foundation
import  UIKit

struct AdvertisementListViewModel {
    
    var service: AdvertisementListServiceProtocol?
    
    weak var dataSource : GenericDataSource<TableSectionViewModel>?
    
    init(dataSource : GenericDataSource<TableSectionViewModel>?) {
        self.dataSource = dataSource
    }
    
    func fetchAdvertisementList() {
        service?.fetchAdvertisementsList(completion: { (result:Result<Advertisements, APIError>) in
            switch result {
            case .success(let advertisements) :
                
                let worker = AdvertisementListWorker()
                let sections = worker.generateSectionsViewModel(advertisements: advertisements.items)
                self.dataSource?.data.value = sections
            case .failure(let error):
                print("-----> \(error)")
            }
        })
    }
}

struct AdvertisementsSectionViewModel: TableSectionViewModel {
    var dataModel: [TableRowViewModel]
    
}

struct AdvertisementRowViewModel : TableRowViewModel {
    
    var rowClass: AnyClass { return AdvertisementCell.self }
    
    var iconURL: String?
    var category: String
    var price: Double
    var city: String
    var roomsArea: String
    
    var rowHeight: CGFloat { return UITableView.automaticDimension }
    
    func configure(_ cell: UITableViewCell) {
        if let advertisementCell = cell as? AdvertisementCell {
            advertisementCell.configure(model: self)
        }
    }
    
}
