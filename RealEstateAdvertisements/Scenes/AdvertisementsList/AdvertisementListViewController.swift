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
    var selectedId: Int?
    
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
        tableView.delegate   = self
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let advertisementDetailsVC = segue.destination as? AdvertisementDetailsViewController {
            advertisementDetailsVC.advertisementId = selectedId
        }
    }
}

// MARK: UITableViewDelegate
extension AdvertisementListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedRow = viewModel?.dataSource?.data.value.row(rowAt: indexPath) as? AdvertisementRowViewModel {
            selectedId = selectedRow.identifier
        }
        self.performSegue(withIdentifier: "AdvertisementDetailsViewController", sender: self)
    }
}

