//
//  TransactionDetails.swift
//  GravosRecycler
//
//  Created by Abhijit on 20/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class TransactionDetails: UIViewController,UITableViewDelegate,UITableViewDataSource
{

    @IBOutlet weak var tblTranDetails: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let sideMenu  = UIBarButtonItem(image: UIImage(named:"BackArrow"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.toggleSideMenu(_:)))
        sideMenu.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = sideMenu
        // Do any additional setup after loading the view.
        
        let help  = UIBarButtonItem(image: UIImage(named:"Icon_Help"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.showHelp(_:)))
        help.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = help
        tblTranDetails.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @objc func toggleSideMenu(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func showHelp(_ sender: Any)
    {
        if let helpVC = self.storyboard?.instantiateViewController(withIdentifier: "HelpVC")
        {
            self.navigationController?.pushViewController(helpVC, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if tableView == tblTranDetails
        {
            if indexPath.row == 0
            {
                return 150
            }
            else if indexPath.row == 1
            {
               return 50
            }
            else if indexPath.row == 2
            {
                return 200
            }
            else if indexPath.row == 3
            {
                return 100
            }
            else
            {
                return UITableViewAutomaticDimension
            }
        }
        else
        {
            return 80
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == tblTranDetails
        {
            return 5
        }
        else
        {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == tblTranDetails
        {
            if indexPath.row == 0
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTblCell", for: indexPath) as! TransactionTblCell
                return cell
            }
            else if indexPath.row == 1
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionScheduleCell", for: indexPath) as! TransactionScheduleCell
                return cell
            }
            else if indexPath.row == 2
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionDetailCell", for: indexPath) as! TransactionDetailCell
                
                
                return cell
            }
            else if indexPath.row == 3
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryAddressCell", for: indexPath) as! DeliveryAddressCell
                return cell
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
                return cell
            }
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleStatusCell", for: indexPath) as! ScheduleStatusCell
            
            return cell
        }
        
        
        
    }
}
