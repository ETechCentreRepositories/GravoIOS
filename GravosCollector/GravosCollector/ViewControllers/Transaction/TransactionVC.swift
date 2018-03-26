//
//  TransactionVC.swift
//  GravosCollector
//
//  Created by Abhijit on 26/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class TransactionVC: UIViewController, UITableViewDataSource,UITableViewDelegate,UITableViewDataSourcePrefetching
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        //--
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCustomCell", for: indexPath) as! TransactionCustomCell
        
        //cell.btnNavigate.addTarget(self, action: #selector(self.performNavigation)    , for: .touchUpInside)
        
        
        return cell
    }
}
