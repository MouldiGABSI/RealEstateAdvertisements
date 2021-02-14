//
//  AdvertisementListViewController.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 12/02/2021.
//
import Foundation
import UIKit

class AdvertisementListViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    var dataSource: AdvertisementListDataSource?
    var viewModel : AdvertisementListViewModel?
    
    
    init(configurator: AdvertisementListConfigurator = AdvertisementListConfigurator.shared) {
        
        super.init(nibName: nil, bundle: nil)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        configure()
    }
    
    // MARK: - Configurator
    
    private func configure(configurator: AdvertisementListConfigurator = AdvertisementListConfigurator.shared) {
        
        configurator.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.register(UINib(nibName: AdvertisementCell.identifier, bundle: nil), forCellReuseIdentifier: AdvertisementCell.identifier)
        self.dataSource?.data.addAndNotify(observer: self) { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        self.title = "Se Loger"
        viewModel?.fetchAdvertisementList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

