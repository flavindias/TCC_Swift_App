//
//  LocalTableViewCell.swift
//  Turismo
//
//  Created by Flaviano Dias Fontes on 17/01/18.
//  Copyright © 2018 Flaviano Dias Fontes. All rights reserved.
//

import UIKit

class LocalTableViewCell: UITableViewCell {

    @IBOutlet weak var localNameUILabel: UILabel!
    @IBOutlet weak var localSiteUILabel: UILabel!
    @IBOutlet weak var localAddressLine1UILabel: UILabel!
    @IBOutlet weak var localAddressLine2UILabel: UILabel!
    @IBOutlet weak var localRatingUILabel: UILabel!
    @IBOutlet weak var localRatingUIImageView: UIImageView!
    @IBOutlet weak var localThumbUIImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
