//
//  PickupsVC.swift
//  GravosCollector
//
//  Created by Abhijit on 20/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import SwiftyGif
class PickupsVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    
    @IBOutlet weak var tblPickUp: UITableView!
    @IBOutlet weak var lblTitleTop: UILabel!
    @IBOutlet weak var lblTitleBottom: UILabel!
    
    var arrPickups : [entPickUpItem] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tblPickUp.delegate = self
        self.tblPickUp.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        tblPickUp.estimatedRowHeight = UITableViewAutomaticDimension
        tblPickUp.rowHeight = UITableViewAutomaticDimension
        tblPickUp.tableFooterView = UIView()
        lblTitleTop.text = "Pickups for today: " + formatDate()
        self.navigationController?.navigationBar.barTintColor = Constants.themeGreen
        self.tblPickUp.reloadData()
        
        let sideMenu  = UIBarButtonItem(image: UIImage(named:"BackArrow"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.toggleSideMenu(_:)))
        sideMenu.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = sideMenu
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func formatDate() ->  String
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let result = formatter.string(from: date)
        return result
    }
    
    @objc func toggleSideMenu(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @objc func performNavigation()
    {
    
        let url = URL(string:"https://www.google.com/maps/dir/?api=1&destination=National%20University%20of%20singapore&travelmode=driving")
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
            UIApplication.shared.openURL(url!)
        }
    }
    
    
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pickupCustomCell", for: indexPath) as! PickupCustomCell
        cell.btnNavigate.addTarget(self, action: #selector(self.performNavigation)    , for: .touchUpInside)
        
        cell.btnNavigate.layer.cornerRadius  = 8
        cell.btnSetStatus.layer.cornerRadius  = 8
        
        if indexPath.row == 0
        {
            cell.lblPickup.text = "Pickup 1"
            cell.contentView.backgroundColor = UIColor.white
            cell.btnNavigate.isHidden = false
            cell.btnSetStatus.isHidden = false
        }
        else if indexPath.row == 1
        {
             cell.lblPickup.text = "Pickup 2(Collected)"
             cell.btnNavigate.isHidden = true
             cell.btnSetStatus.isHidden = true
             cell.contentView.backgroundColor = UIColor.lightGray
             cell.lblPickup.textColor = UIColor.white
             cell.lblLocation.textColor = UIColor.white
        }
        else
        {
             cell.lblPickup.text = "Pickup 3(Bulk)"
             cell.contentView.backgroundColor = UIColor.white
             cell.btnNavigate.isHidden = false
             cell.btnSetStatus.isHidden = false
        }
        
        
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row == 0 || indexPath.row == 1
        {
            if let transactionVC = self.storyboard?.instantiateViewController(withIdentifier: "TransactionVC")
            {
                self.navigationController?.pushViewController(transactionVC, animated: true)
            }
        }
        else
        {
            if let bulktransactionVC = self.storyboard?.instantiateViewController(withIdentifier: "BulkTransactionVC")
            {
                self.navigationController?.pushViewController(bulktransactionVC, animated: true)
            }
        }
    }
}
