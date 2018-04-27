//
//  TransactionDetailCell.swift
//  GravosRecycler
//
//  Created by Abhijit on 20/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class TransactionDetailCell: UITableViewCell {

    @IBOutlet weak var tblScheduleStatus: UITableView!
    
    @IBOutlet weak var viwCover: UIView!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        
        tblScheduleStatus.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
