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
    
     var selectedMenuItem : Int = 0
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
        // Preserve selection between presentations
        self.tblSideMenu.clearsContextBeforeDrawing = true
        tblSideMenu.selectRow(at: IndexPath(row: selectedMenuItem, section: 0), animated: false, scrollPosition: .middle)
        tblSideMenu.tableFooterView = UIView()
        
        imgProfile.layer.borderWidth = 0.1
        imgProfile.layer.masksToBounds = false
        imgProfile.layer.borderColor = UIColor.black.cgColor
        imgProfile.layer.cornerRadius = imgProfile.frame.height/2
        imgProfile.clipsToBounds = true
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

    @IBAction func showProfile(_ sender: Any)
    {
         let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
         var destViewController : UIViewController
         destViewController = mainStoryboard.instantiateViewController(withIdentifier: "ProfileVC")
         sideMenuController()?.setContentViewController(destViewController)
    }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if (indexPath.row == selectedMenuItem) {
            return
        }
        
        selectedMenuItem = indexPath.row
        
        //Present new view controller
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        switch (indexPath.row) {
        case 0:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeVC")
            break
        case 1:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "NotificationsVC")
            break
        case 2:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "TransactionVC")
            break
        case 3:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "CalenderVC")
            break
        default:
            destViewController = mainStoryboard.instantiateViewController(withIdentifier: "SettingsVC")
            break
        }
        sideMenuController()?.setContentViewController(destViewController)
    
        
    }
    
}
