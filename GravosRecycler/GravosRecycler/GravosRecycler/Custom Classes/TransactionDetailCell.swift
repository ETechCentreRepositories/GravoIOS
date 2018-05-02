//
//  TransactionDetailCell.swift
//  GravosRecycler
//
//  Created by Abhijit on 20/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import JKSteppedProgressBar

class TransactionDetailCell: UITableViewCell {

 
    
    @IBOutlet weak var steppedView: SteppedProgressBar!
    @IBOutlet weak var tblScheduleStatus: UITableView!
    
    @IBOutlet weak var viwCover: UIView!
    
    var inset: UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 30, right: 30)
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        
        self.configureTitleProgressBar()
        tblScheduleStatus.layer.cornerRadius = 8
    }

    
    func configureTitleProgressBar()
    {
        var screenSize: CGRect!
        var screenWidth: CGFloat!
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        
        
        steppedView.stepDrawingMode = .fill
        steppedView.titles = ["Waiting", "Paid", "Collected","Completed"]
        steppedView.titleOffset = 5.0
        steppedView.inactiveTextColor = UIColor.darkGray
        steppedView.circleSpacing = screenWidth/5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
