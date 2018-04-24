//
//  ChildPageVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 17/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class ChildPageVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    @IBOutlet weak var tblMaterialType: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        tblMaterialType.estimatedRowHeight = UITableViewAutomaticDimension
        tblMaterialType.rowHeight = UITableViewAutomaticDimension
        tblMaterialType.tableFooterView = UIView()
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTypeCell", for: indexPath) as! HomeTypeCell
        
        cell.contentView.backgroundColor = self.view.backgroundColor
       // cell.btnNavigate.addTarget(self, action: #selector(self.performNavigation)    , for: .touchUpInside)
        
        return cell
    }
}
