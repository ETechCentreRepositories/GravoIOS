//
//  TransactionCustomCell.swift
//  GravosCollector
//
//  Created by Abhijit on 26/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import GMStepper

class TransactionCustomCell: UITableViewCell
{

    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lblItemPrice: UILabel!
    @IBOutlet weak var btnDeleteItem: UIButton!
    @IBOutlet weak var stepperWeight: GMStepper!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
