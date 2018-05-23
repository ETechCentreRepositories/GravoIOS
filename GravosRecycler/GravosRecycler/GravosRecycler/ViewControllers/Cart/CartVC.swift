//
//  CartVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 19/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class CartVC: UIViewController, UITableViewDataSource,UITableViewDelegate
{

	@IBOutlet weak var datePickerConstraint: NSLayoutConstraint!
	@IBOutlet weak var tblCart: UITableView!
    @IBOutlet weak var dtTransaction: UIDatePicker!
    @IBOutlet weak var viwDatePicker: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        let sideMenu  = UIBarButtonItem(image: UIImage(named:"BackArrow"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.toggleSideMenu(_:)))
        sideMenu.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = sideMenu
        tblCart.tableFooterView = UIView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func toggleSideMenu(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
            return "3 Itmes in your bag"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCustomCell", for: indexPath) as! TransactionCustomCell
        
        cell.lblTitle.text = "EWASTE | LCD Screeen"
        cell.lblWeight.text = "6.4KG"
        cell.lblItemPrice.text = "$0.6"
        cell.stepperWeight.value = 2
        
        
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func savePickedDate(_ sender: Any)
    {
        
    }
    
    @IBAction func cancelPickedDate(_ sender: Any)
    {
        
    }
    
}
