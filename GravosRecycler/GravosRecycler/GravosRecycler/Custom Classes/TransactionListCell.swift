//
//  TransactionListCell.swift
//  GravosRecycler
//
//  Created by Abhijit on 24/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class TransactionListCell: UITableViewCell
{

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var lblScheduleDate: UILabel!
    @IBOutlet weak var btnStatus: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
