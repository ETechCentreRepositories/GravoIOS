//
//  TransactionTblCell.swift
//  GravosRecycler
//
//  Created by Abhijit on 19/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class TransactionTblCell: UITableViewCell
{

    @IBOutlet weak var tblItems: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}

extension TransactionTblCell
{
    func setTableviewDataSourceDelegate<D: UITableViewDelegate & UITableViewDataSource>(_ dataSouceDelegate: D, forRow row :Int)
    {
        tblItems.delegate = dataSouceDelegate
        tblItems.dataSource = dataSouceDelegate
        
        tblItems.reloadData()
    }
}
