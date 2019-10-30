//
//  CurrencyTableViewCell.swift
//  1curs-valutar
//
//  Created by Dan Pop on 01/05/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet weak var coin: UILabel!
    @IBOutlet weak var sellValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
