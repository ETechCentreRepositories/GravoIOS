//
//  CartVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 19/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import Alamofire


class CartVC: UIViewController, UITableViewDataSource,UITableViewDelegate
{
    
	@IBOutlet weak var datePickerConstraint: NSLayoutConstraint!
	@IBOutlet weak var tblCart: UITableView!
    @IBOutlet weak var dtTransaction: UIDatePicker!
    @IBOutlet weak var viwDatePicker: UIView!
    
	var getArrayResult : [CartItem] = []
	
	
    var getUserId = UserDefaults.standard.value(forKey: "id")
	

    
    
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
    
        Alamofire.request("http://ehostingcentre.com/gravo/getcart.php?userid=\(getUserId!)",method: .get).responseJSON{
            response in
            let data = response.result.value as! NSDictionary
            //print("dictionary \(data)");
            let getResult = data.value(forKey: "result")! as! NSArray
			UserDefaults.standard.set(getResult, forKey: "getArraySum")
			for result in getResult as! [[String:Any]]{
				let category_id = result["category_id"]as! String
			}
			
			
			
			
			
			
        }
		
		
     
       
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
		
		let sumArray = UserDefaults.standard.array(forKey: "getArraySum")!
		return  "\(sumArray.count) in your bag"
		
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
		let sumArray = UserDefaults.standard.array(forKey: "getArraySum")!
	
		return sumArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCustomCell", for: indexPath) as! TransactionCustomCell
		
		let getresult = UserDefaults.standard.array(forKey: "getArraySum")
		for result in getresult as! [[String:Any]]{
			let getcartId = result["cart_id"]as! String
			let getcart_recycler_id = result["cart_recycler_id"] as! String
			let category_id = result["category_id"]as! String
			let id = result["id"]as! String
			let price = result["price"] as! String
			let weight = result["weight"]as! String
			//print(" \(getcartId) \(getcart_recycler_id) \(category_id) \(id) \(price) \(weight) ")
			
			let passtomodals = CartItem(cartid: getcartId, cartrecycleid: getcart_recycler_id, category_id: category_id, id: id, price: price, weight: weight)
			
			
			self.getArrayResult.append(passtomodals)
			
			
		}
		
			let getCell = getArrayResult[indexPath.row]
			cell.lblItemPrice.text = getCell.price
			cell.stepperWeight.value = Double(getCell.weight)!
			cell.imageView?.image = UIImage(named: "\(getCell.category_id)")
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
