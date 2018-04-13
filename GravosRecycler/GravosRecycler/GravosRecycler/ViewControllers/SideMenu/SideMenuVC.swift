//
//  SideMenuVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 12/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{

 
    @IBOutlet weak var tblSideMenu: UITableView!
    @IBOutlet weak var lblProfileName: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    
    let arrSideMenuTitle = ["Home","Notifications","Transactions","Calender","Settings"]
    let arrSideMenuIcons = ["Icon_Home","Icon_Notifications","Icon_Transactions","Icon_Calender","Icon_Settings"]
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        self.imgProfile.makeRounded()
        
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

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrSideMenuTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath) as! SideMenuCell
        
        cell.imgIcon.image = UIImage(named: arrSideMenuIcons[indexPath.row])
        cell.lblTitle.text = arrSideMenuTitle[indexPath.row]
        return cell
    }
    
}
