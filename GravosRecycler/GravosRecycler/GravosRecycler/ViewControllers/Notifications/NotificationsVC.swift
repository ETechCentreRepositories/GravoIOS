//
//  NotificationsVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 13/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
class NotificationsVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    @IBOutlet weak var htConstraintContainer: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tblNotifications: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tblNotifications.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        
        self.htConstraintContainer.constant = self.tblNotifications.contentSize.height
        containerView.backgroundColor = UIColor.clear
        containerView.layer.shadowColor = UIColor.darkGray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        containerView.layer.shadowOpacity = 1.0
        containerView.layer.shadowRadius = 2
        
        self.tblNotifications.layer.cornerRadius = 10
        self.tblNotifications.layer.masksToBounds = true
        self.view.addSubview(containerView)
        containerView.addSubview(self.tblNotifications)
        
        tblNotifications.estimatedRowHeight = UITableViewAutomaticDimension
        tblNotifications.rowHeight = UITableViewAutomaticDimension
        tblNotifications.tableFooterView = UIView()
        
        tblNotifications.separatorStyle = .none
        
        let sideMenu  = UIBarButtonItem(image: UIImage(named:"Icon_SideMenu"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.toggleSideMenu(_:)))
        sideMenu.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = sideMenu
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
       // tblNotifications.layer.cornerRadius = 10
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func toggleSideMenu(_ sender: Any)
    {
        toggleSideMenuView()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationcell", for: indexPath)
        
        
        if indexPath.row != 0
        {
            cell.backgroundColor = UIColor.white
            cell.textLabel?.text = " "
        }
        else
        {
            let lblTotalNotifications = UILabel(frame: CGRect(x: tblNotifications.center.x - 50, y: cell.contentView.center.y - 10, width: cell.frame.width, height: 24))
            cell.contentView.addSubview(lblTotalNotifications)
            lblTotalNotifications.text = "No Notifications"
            lblTotalNotifications.textColor = UIColor.white
            cell.backgroundColor = Constants.themeGreen
        }
        return cell
    }
    
}
