//
//  MenuViewController.swift
//  GravosRecycler
//
//  Created by Ivan Lipotan on 25/9/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
protocol  SlideMenuDelegate {
	func slideMenuItemSelectedAtIndex(_ index : Int32)
}
struct Headline{
    var title: String
    var image: String
}

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
   
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var txtName: UILabel!
    var btnMenu: UIButton!
    var delegate : SlideMenuDelegate?
    
    var headlines = [
        Headline (title:"Home", image:"iconHome"),
        Headline (title:"Notification", image:"iconNotification"),
        Headline (title:"Transactions", image:"Icon_Transactions"),
        Headline (title:"Calendar", image:"iconCalendar"),
        Headline (title:"About us", image:"icon_aboutus"),
        Headline(title:"Sponsor",image:"iconSponsor"),
        Headline (title:"Invite", image:""),
        
        
        ]
    
	override func viewDidLoad() {
		super.viewDidLoad()
        
        let defaultValues = UserDefaults.standard
        if let getFullname = defaultValues.string(forKey: "full_name"){
            txtName.text = getFullname
        }
        
		let urlImage = NSURL(string : UserDefaults.standard.value(forKey: "photo")! as! String)
		print(urlImage as Any)
		
		
		let data = NSData(contentsOf: urlImage! as URL)
		
		if data != nil{
			
			imgLogo.image = UIImage(data: data! as Data)
		}
		
	}
    
    
    override func viewDidAppear(_ animated: Bool) {
        let defaultValues = UserDefaults.standard
        if let getFullname = defaultValues.string(forKey: "full_name"){
            txtName.text = getFullname
        }
        
		let urlImage = NSURL(string : UserDefaults.standard.value(forKey: "photo")! as! String)
		print(urlImage as Any)
		
		
		let data = NSData(contentsOf: urlImage! as URL)
       
        if data != nil{

            imgLogo.image = UIImage(data: data! as Data)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        
        let headline = headlines[indexPath.row]
        cell.textLabel?.text = headline.title
        
        cell.imageView?.image = UIImage(named: headline.image)
        return cell
    }
    
    @IBAction func btnProfileTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let headline = indexPath.row
        print(headline)
    
        if(headline == 1){
            let storyboard: UIStoryboard =  UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "NotificationsVC") as! NotificationsVC
			
            self.navigationController?.pushViewController(vc, animated: true)
        }else if (headline == 2){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "TransactionVC") as! TransactionVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else if(headline == 3){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CalenderVC") as! CalenderVC
            self.navigationController?.pushViewController(vc, animated: true)
		} else if(headline == 4){
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			let vc = storyboard.instantiateViewController(withIdentifier: "AboutUsVC") as! AboutUsVC
			self.navigationController?.pushViewController(vc, animated: true)
		} else if(headline == 5) {
			//sponsor tab
			
		} else if(headline == 6 ){
			
		} else{
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			let vc = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
			self.navigationController?.pushViewController(vc, animated: true)
		}
        
        
       
        
    }
    
    @IBOutlet weak var btnCloseMenuOverlay: UIButton!
    
    
    

    @IBAction func btnClosedTapped(_ sender: UIButton) {
        
        
        btnMenu.tag = 0
        btnMenu.isHidden = false
        
        if(self.delegate != nil){
            var index = Int32(sender.tag)
            if(sender ==  self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        UIView.animate(withDuration: 0.3, animations: {
            () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        },completion:{(finished) ->Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        })
    }
    
}
