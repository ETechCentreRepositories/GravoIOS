//
//  ProfileVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 19/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    @IBOutlet weak var imgDisplayPic: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var tblProfile: UITableView!
    

    let arrKey 			= ["Name","Email","Address"]
    var arrValue 		= ["Ryme Hobbs","abernathy_marty@hotmail.com","814 Halley Lang Apt 2014"]
    
    let arrKeyOthers 	= 	["Gravos","Logout"]
    let arrValueOthers 	= ["Coins Earned: $4.0"," "]
    var loggedInUser	= LoggedInUsers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		if loggedInUser.firstname != ""
		{
			arrValue.removeAll()
			arrValue = [loggedInUser.firstname,loggedInUser.email,loggedInUser.address]
			lblTitle.text = loggedInUser.firstname
		}
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.navigationBar.barTintColor  = UIColor.white
        self.navigationController?.navigationBar.tintColor     = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.black]
        
        self.tblProfile.tableFooterView = UIView()
        let sideMenu  = UIBarButtonItem(image: UIImage(named:"Icon_SideMenu"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.toggleSideMenu(_:)))
        sideMenu.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = sideMenu
        
        
        let rightMenu  = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(self.editProfile(sender:)))
        rightMenu.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = rightMenu
		
		self.customiseUserInterface()
    }
	
	
	func customiseUserInterface()
	{
		imgDisplayPic.layer.borderWidth = 0.1
		imgDisplayPic.layer.masksToBounds = false
		imgDisplayPic.layer.borderColor = UIColor.black.cgColor
		imgDisplayPic.layer.cornerRadius = imgDisplayPic.frame.height/2
		imgDisplayPic.clipsToBounds = true
	}
    @objc func toggleSideMenu(_ sender: Any)
    {
        toggleSideMenuView()
    }
    
    @objc func editProfile(sender: Any)
    {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        destViewController = mainStoryboard.instantiateViewController(withIdentifier: .editProfile)
        self.navigationController?.pushViewController(destViewController, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0
        {
            return 3
        }
        else
        {
            return 2
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0
        {
            return .accountinfo
        }
        else
        {
            return .others
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: .profilecell, for: indexPath) as! ProfileCell
		
        if indexPath.section == 0
        {
            cell.lblKey.text = arrKey[indexPath.row]
            cell.lblValue.text = arrValue[indexPath.row]
            cell.accessoryType = .none
        }
        else if indexPath.section == 1
        {
            cell.lblKey.text = arrKeyOthers[indexPath.row]
            cell.lblValue.text = arrValueOthers[indexPath.row]
            cell.accessoryType = .disclosureIndicator
            
            if indexPath.row == 0
            {
                cell.lblKey.textColor = UIColor.orange
                cell.lblValue.textColor = UIColor.orange
            }
        }
		else
		{
			cell.lblKey.text = arrKey[indexPath.row]
			cell.lblValue.text = arrValue[indexPath.row]
			cell.accessoryType = .none
		}
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.section == 1
        {
            if indexPath.row == 0
            {
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
                var destViewController : UIViewController
                destViewController = mainStoryboard.instantiateViewController(withIdentifier: "LeaderBoardVC")
                self.navigationController?.pushViewController(destViewController, animated: true)
            }
            if indexPath.row == 1 //LOGOUT
            {
                self.dismiss(animated: true, completion: nil)

            }
        }
    }
}

