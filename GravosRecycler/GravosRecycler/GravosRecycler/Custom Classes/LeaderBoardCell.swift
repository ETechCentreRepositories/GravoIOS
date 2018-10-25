//
//  LeaderBoardCell.swift
//  GravosRecycler
//
//  Created by Abhijit on 19/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class LeaderBoardCell: UITableViewCell {

    @IBOutlet weak var lblGreenTitle: UILabel!
    @IBOutlet weak var lblSerial: UILabel!
	
    @IBOutlet weak var imgGreenType: UIImageView!
  
    @IBOutlet weak var lblpoints: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
