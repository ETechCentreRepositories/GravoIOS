//
//  ProfileVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 19/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import Alamofire

struct getDetails{
	var getFullName: String
	
	var getAddress: String
	var getEmail: String
}


class ProfileVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
     let URL_GET_USERS = "http://ehostingcentre.com/gravo/getUsers.php?email=\(UserDefaults.standard.value(forKey: "email")! as! String)"
    @IBOutlet weak var imgDisplayPic: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tblProfile: UITableView!
    @IBOutlet weak var lblPoints: UILabel!
    @IBAction func btnProfileDetails(_ sender: Any) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        destViewController = mainStoryboard.instantiateViewController(withIdentifier: "LeaderBoardVC")
        self.navigationController?.pushViewController(destViewController, animated: true)
        
        
    }
    
	
	
	var getName: String = ""
	var getEmail: String = ""
	var getAddress: String = ""
    
  
	let arrKey = ["Name","Email","Address"]

	
    let arrKeyOthers 	= 	["Logout"]

    var loggedInUser	= LoggedInUsers()
    
    
    var userdefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
		
            
	}
		
	

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool)
    {
		
		
		Alamofire.request(URL_GET_USERS,method: .get).responseJSON{
			response in
			
			let defaultValues = UserDefaults.standard
			print("NEW RESPONSE \(response)")
			
			let result = response.result.value as!NSDictionary
			
			let user  = result.value(forKey: "users")! as! NSArray
			
			let passfullname = user.value(forKey: "full_name")as! [String]
			let passfirstname = user.value(forKey: "first_name")as! [String]
            
            let passlastname = user.value(forKey: "last_name")as! [String]
			let passaddress = user.value(forKey: "address")as! [String]
			
			defaultValues.set(passfullname[0], forKey: "passfullname")
			
			defaultValues.set(passaddress[0], forKey:"passaddress")
            
            defaultValues.set(passfirstname[0], forKey: "passfirstname")
            defaultValues.set(passlastname[0], forKey: "passlastname")
            
			
		}
        self.navigationController?.navigationBar.barTintColor  = UIColor.white
        self.navigationController?.navigationBar.tintColor     = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.black]
        
        self.tblProfile.tableFooterView = UIView()
        let sideMenu  = UIBarButtonItem(image: UIImage(named:"BackArrow"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.toggleSideMenu(_:)))
        sideMenu.tintColor = UIColor.black
        
        self.navigationItem.leftBarButtonItem = sideMenu
        
        
        let rightMenu  = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(self.editProfile(sender:)))
        rightMenu.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = rightMenu
		
		self.customiseUserInterface()
       let getfullname = userdefault.value(forKey: "full_name")!
        let getpoint = userdefault.value(forKey: "total_points")!
		lblTitle.text! = getfullname as! String
		lblPoints.text! = "\(getpoint as!String) points"
		
        let urlImage = NSURL(string : UserDefaults.standard.value(forKey: "photo")! as! String)
        print(urlImage as Any)
        
        
        let data = NSData(contentsOf: urlImage! as URL)
        
        if data != nil{
            
            imgDisplayPic.image = UIImage(data: data! as Data)
        }
        
    }
	
	
		
	
	var arrValue = ["\(UserDefaults.standard.value(forKey: "full_name")!)","\(UserDefaults.standard.value(forKey: "email")!)","\(UserDefaults.standard.value(forKey: "address")!)"]
	
   
	
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
        self.navigationController?.popViewController(animated: true)
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
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
		if section == 0
		{
			 return .accountinfo
		}
		else
		{
			
			return "          "
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
			cell.lblValue.text = ""
            cell.accessoryType = .disclosureIndicator
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
            if indexPath.row == 0 //LOGOUT
            {
				let uiAlert = UIAlertController(title: "Logout", message: "Are you sure want to log out", preferredStyle: UIAlertControllerStyle.alert)
				self.present(uiAlert, animated: true, completion: nil)
				
				uiAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
					
					UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
					UserDefaults.standard.synchronize()

					
					self.dismiss(animated: true, completion: nil)
				}))
				
				uiAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
					
				}))
				
            }
        }
    }
}

