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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationcell", for: indexPath)
        cell.textLabel?.text = "This is row \(indexPath.row)"
        
        if indexPath.row != 0
        {
            cell.backgroundColor = UIColor.white
        }
        return cell
    }
}
