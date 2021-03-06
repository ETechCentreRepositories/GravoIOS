//
//  HomeCollCell.swift
//  GravosRecycler
//
//  Created by Abhijit on 10/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class HomeCollCell: UICollectionViewCell
{
    
    @IBOutlet weak var viwCollectionCell: UIView!
    @IBOutlet weak var imgCellType: UIImageView!
    @IBOutlet weak var lblCellTitle: UILabel!
    @IBOutlet weak var lblCellSubTitle: UILabel!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
	
        self.configureTitleProgressBar()
    }
    
    
    func configureTitleProgressBar()
    {
        self.viwCollectionCell.layer.shadowColor = UIColor.black.cgColor
        self.viwCollectionCell.layer.shadowOpacity = 0.5
        self.viwCollectionCell.layer.shadowOffset = CGSize.zero
        self.viwCollectionCell.layer.shadowRadius = 2
    
    }
    /*required override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.layer.cornerRadius = 2.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    
    
}
