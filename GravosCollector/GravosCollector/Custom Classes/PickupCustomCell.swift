//
//  PickupCustomCell.swift
//  GravosCollector
//
//  Created by Abhijit on 20/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class PickupCustomCell: UITableViewCell
{

    @IBOutlet weak var lblPickup: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var btnNavigate: UIButton!
    @IBOutlet weak var btnSetStatus: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
