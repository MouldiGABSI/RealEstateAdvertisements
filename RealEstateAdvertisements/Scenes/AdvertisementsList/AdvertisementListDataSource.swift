//
//  AdvertisementListDataSource.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 12/02/2021.
//

import Foundation
import UIKit

class AdvertisementListDataSource : GenericDataSource<TableSectionViewModel>, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.value.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.numberOfRows(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if let rowClass = data.value.row(rowAt: indexPath)?.rowClass {
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: rowClass)) {
                data.value.row(rowAt: indexPath)?.configure(cell)
                return cell
            }
        }
        return UITableViewCell()
    }
}

