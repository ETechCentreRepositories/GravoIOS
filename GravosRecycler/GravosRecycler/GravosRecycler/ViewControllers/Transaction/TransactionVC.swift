//
//  TransactionVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 19/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class TransactionVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var tblTransactionlist: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        let sideMenu  = UIBarButtonItem(image: UIImage(named:"Icon_SideMenu"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.toggleSideMenu(_:)))
        sideMenu.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = sideMenu
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationItem.setHidesBackButton(true, animated: true)
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        tblTransactionlist.tableFooterView = UIView()
    }
    
    @objc func toggleSideMenu(_ sender: Any)
    {
        toggleSideMenuView()
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == tblTransactionlist
        {
            return 2
        }
        else
        {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       
        if tableView == tblTransactionlist
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTblCell", for: indexPath) as! TransactionTblCell
            
            cell.tblItems.delegate = self
            cell.tblItems.dataSource = self
            return cell
            
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionItemCell", for: indexPath) as! TransactionItemCell
        
            return cell
            
        }
        
        
    }
}
