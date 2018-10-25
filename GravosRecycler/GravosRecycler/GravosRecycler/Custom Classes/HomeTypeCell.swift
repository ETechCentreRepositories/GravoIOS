//
//  HomeTypeCell.swift
//  GravosRecycler
//
//  Created by Abhijit on 19/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import GMStepper





class HomeTypeCell: UITableViewCell
{
    @IBOutlet weak var lblTitle: UILabel!
   
    @IBOutlet weak var stepper: GMStepper!
    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgMaterialType: UIImageView!
    
   
    @IBOutlet weak var btnAdd: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

		
		}
	
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
