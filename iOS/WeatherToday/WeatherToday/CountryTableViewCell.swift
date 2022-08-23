//
//  CountryTableViewCell.swift
//  WeatherToday
//
//  Created by 이조은 on 2022/08/22.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet var flag: UIImageView!
    @IBOutlet var countryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
