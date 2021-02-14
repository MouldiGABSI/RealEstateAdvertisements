//
//  AdvertisementCell.swift
//  RealEstateAdvertisements
//
//  Created by Mouldi GABSI on 12/02/2021.
//

import UIKit

class AdvertisementCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var roomsAreaLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func configure(model: AdvertisementRowViewModel) {
        
        iconImage.clipsToBounds = true
        iconImage.roundCorners(corners: [.topLeft,.topRight], radius: 8.0)
        cardView.layer.masksToBounds = true
        categoryLabel.text  = model.category
        roomsAreaLabel.text = model.roomsArea
        priceLabel.text     = "\(model.price.asLocaleCurrency ?? "")"
        locationLabel.text  = model.city
        if let iconUrString = model.iconURL, let iconURL = URL(string: iconUrString) {
            ImageLoader.image(for: iconURL) { image in
              self.iconImage.image = image
            }
        }
    }
}
