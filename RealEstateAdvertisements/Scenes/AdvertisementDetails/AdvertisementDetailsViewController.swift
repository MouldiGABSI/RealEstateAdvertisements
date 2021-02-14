//
//  AdvertisementDetailsViewController.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 14/02/2021.
//

import UIKit

class AdvertisementDetailsViewController: UIViewController {
    
    @IBOutlet weak var iconImageView:     UIImageView!
    @IBOutlet weak var propertyTypeLabel: UILabel!
    @IBOutlet weak var roomsAreaLabel:    UILabel!
    @IBOutlet weak var priceLabel:        UILabel!
    @IBOutlet weak var cityLabel:         UILabel!
    @IBOutlet weak var professionalLabel: UILabel!
    
    var viewModel : ObservableDetailsViewModelProtocol?
    var advertisementId: Int?
    init(configurator: AdvertisementDetailsConfigurator = AdvertisementDetailsConfigurator.shared) {
        
        super.init(nibName: nil, bundle: nil)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        configure()
    }
    
    // MARK: - Configurator
    
    private func configure(configurator: AdvertisementDetailsConfigurator = AdvertisementDetailsConfigurator.shared) {
        
        configurator.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.advertisement.bind({ (advertisement) in
            DispatchQueue.main.async {
                self.updateView(advertisement: advertisement)
            }
        })
        viewModel?.errorMessage.bind({ (errorMessage) in
            DispatchQueue.main.async {
                self.displayErrorMessage(errorMessage: errorMessage)
            }
        })
        
        if let _advetisementId = advertisementId {
            viewModel?.fetchAdvertisementDetails(advertisementId: _advetisementId)
        }
    }
    
    private func updateView(advertisement: AdvertisementDetailsUIModel?) {
        if let iconURL = advertisement?.iconURL {
            ImageLoader.image(for: iconURL) { image in
                self.iconImageView.image = image
            }
        }
        propertyTypeLabel.text = advertisement?.propertyType
        roomsAreaLabel.text    = advertisement?.roomsArea
        priceLabel.text        = advertisement?.priceString
        cityLabel.text         = advertisement?.city
        professionalLabel.text = advertisement?.professional
    }
    
    private func displayErrorMessage(errorMessage: String?) {
        
    }
}
