//
//  PickupsVC.swift
//  GravosCollector
//
//  Created by Abhijit on 20/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class PickupsVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    
    @IBOutlet weak var tblPickUp: UITableView!
    @IBOutlet weak var lblTitleTop: UILabel!
    @IBOutlet weak var lblTitleBottom: UILabel!
    
    var arrPickups : [entPickUpItem] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tblPickUp.delegate = self
        self.tblPickUp.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        tblPickUp.estimatedRowHeight = UITableViewAutomaticDimension
        tblPickUp.rowHeight = UITableViewAutomaticDimension
        tblPickUp.tableFooterView = UIView()
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

    @objc func performNavigation()
    {
    
        let url = URL(string:"https://www.google.com/maps/dir/?api=1&destination=National%20University%20of%20singapore&travelmode=driving")
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
            UIApplication.shared.openURL(url!)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "pickupCustomCell", for: indexPath) as! PickupCustomCell
        
        cell.btnNavigate.addTarget(self, action: #selector(self.performNavigation)	, for: .touchUpInside)
        
        
        return cell
    }
}
