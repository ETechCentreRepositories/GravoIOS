//
//  SettingsVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 19/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    @IBOutlet weak var tblSettings: UITableView!
    let arrSideMenuTitle = ["Terms and Conditions","Privacy Policy","About Gravos"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.tblSettings.tableFooterView = UIView()
        
        let sideMenu  = UIBarButtonItem(image: UIImage(named:"Icon_SideMenu"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.toggleSideMenu(_:)))
        sideMenu.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = sideMenu
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationItem.setHidesBackButton(true, animated: true)
        
        self.navigationItem.setHidesBackButton(true, animated: true)
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

    @objc func toggleSideMenu(_ sender: Any)
    {
        toggleSideMenuView()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrSideMenuTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)
        
        cell.textLabel?.text = arrSideMenuTitle[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 0
        {
            if let tncVC = self.storyboard?.instantiateViewController(withIdentifier: "TNCVC")
            {
                self.navigationController?.pushViewController(tncVC, animated: true)
            }
        }
        else if indexPath.row == 1
        {
            if let privacyPolicyVC = self.storyboard?.instantiateViewController(withIdentifier: "PrivacyPolicyVC")
            {
                self.navigationController?.pushViewController(privacyPolicyVC, animated: true)
            }
        }
        else
        {
            UIApplication.shared.open(URL(string : "http://greenravolution.com/")!, options: [:], completionHandler: { (status) in
                
            })
        }
    }
}
