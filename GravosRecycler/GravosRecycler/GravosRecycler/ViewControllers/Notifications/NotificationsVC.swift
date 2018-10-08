//
//  NotificationsVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 13/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
class NotificationsVC: BaseViewController,UITableViewDelegate,UITableViewDataSource
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
         addSlideMenuButton()
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
        
    
		
		let help  = UIBarButtonItem(image: UIImage(named:"Icon_Help"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.showHelp(_:)))
		help.tintColor = UIColor.black
		
		let cart  = UIBarButtonItem(image: UIImage(named:"Icon_Cart"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.showCart(_:)))
		help.tintColor = UIColor.black
		self.navigationItem.rightBarButtonItems = [cart,help]
		
		self.navigationItem.setHidesBackButton(true, animated: true)
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@objc func showHelp(_ sender: Any)
	{
		if let helpVC = self.storyboard?.instantiateViewController(withIdentifier: "HelpVC")
		{
			self.navigationController?.pushViewController(helpVC, animated: true)
		}
	}
	
	
	@objc func showCart(_ sender: Any)
	{
		if let helpVC = self.storyboard?.instantiateViewController(withIdentifier: "CartVC")
		{
			self.navigationController?.pushViewController(helpVC, animated: true)
		}
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
