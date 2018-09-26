//
//  PickupsVC.swift
//  GravosCollector
//
//  Created by Ivan Lipotan on 14/9/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class PickupsVC: UIViewController,UITableViewDataSource,UITextFieldDelegate{
    
    let todayList:[String] =  ["Today Task item 1","Today Task item 2"]
    
    let historyList:[String] = ["History Item 1","History Item 2"]
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnValue = 0
        return returnValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell",for:indexPath)
        return myCell
    }
    
  
    
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var myTableView: UITableView!
    
    
//    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnLogout(_ sender: UIBarButtonItem) {
        
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        
        UserDefaults.standard.synchronize()
        var uiAlert = UIAlertController(title: "Logout", message: "Are you sure want to log out", preferredStyle: UIAlertControllerStyle.alert)
        self.present(uiAlert, animated: true, completion: nil)
        
        uiAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
           
            
            
            //switching to login screen
            let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            self.navigationController?.pushViewController(loginViewController, animated: true)
            
            
            self.dismiss(animated: false, completion: nil)
        }))
        
        uiAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
            
        }))
        
    }
    
    
}
