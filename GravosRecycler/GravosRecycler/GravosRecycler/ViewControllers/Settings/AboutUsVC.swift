//
//  AboutUsVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 27/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

struct newHeadline{
    
    var  title: String
    var image: String
}
class AboutUsVC: BaseViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    

    var headlines = [
        newHeadline (title: "Terms And Conditions",image: ""),
        newHeadline(title: "Privacy Policy",image: ""),
        newHeadline(title: "About Gravo",image: ""),
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            addSlideMenuButton()
        tableView.tableFooterView = UIView()
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines.count
       
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        let  headline = headlines[indexPath.row]
       
        cell.textLabel?.text = headline.title
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var headline = indexPath.row
        
        if(headline == 0){
            let storyboard: UIStoryboard =  UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "TNCVC") as! TNCVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else if(headline == 1){
            let vc = storyboard!.instantiateViewController(withIdentifier: "PrivacyPolicyVC") as! PrivacyVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = storyboard!.instantiateViewController(withIdentifier: "AboutGravoVC") as! AboutGravoVC
            self.navigationController?.pushViewController(vc, animated: true)
        }

    }
    
    

}
