//
//  ChildPageVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 17/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import Alamofire

class ChildPageVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    var getArrayResult : [Result] = []
   
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
	var defaultvalue = UserDefaults.standard
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let getresult = defaultvalue.array(forKey: "getresult")
//		print(getresult[0])
		if(self.title == "Paper"){
            return getresult![0...3].count
		
        } else if(self.title == "E-Waste") {
            return  getresult![12...17].count
		}
		else if(self.title == "Metals"){
			return  getresult![4...11].count
			
		}
		return getresult!.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTypeCell", for: indexPath) as! HomeTypeCell
		
		
		let getresult = defaultvalue.array(forKey: "getresult")
        for result in getresult as! [[String:Any]]{
            let getItem = result["item"] as! String
            let getId = result["id"] as! NSString
            let getrate = result["rate"] as! String
            let getpoint = result["points"]as! NSString
            let getco2_points = result["co2_points"]as! String
            let getachievement_tag = result["achievement_tag"]as! String
            
           //print("GET ITEM : \(getItem)\(getId)\(getrate)\(getpoint)\(getco2_points)\(getachievement_tag)")
			
			
			
            let passtomodals = Result(id: getId as String, item: getItem, rate: getrate, points: getpoint as String, c02_points: getco2_points, achievement_tag: getachievement_tag)
			
            getArrayResult.append(passtomodals)
			
			//print([getArrayResult])
		
	
		}
		let getCell = getArrayResult[indexPath.row]
		var getItemName = getCell.item
		let wordToRemove = "Paper | "
		
		if let range = getItemName.range(of: wordToRemove){
			getItemName.removeSubrange(range)
			
		}
		
		cell.lblTitle.text = getItemName
		
        cell.imgMaterialType.image = UIImage(named: "\(getCell.item)")
		cell.lblPrice.text = getCell.rate
		
		//print("totalArray : \(getArrayResult.count)")
		
		if self.title  == "E-Waste"{
			
			let getRange = getArrayResult.suffix(6)
			//print("GET RANGE : \(getRange)")
			let newArray = Array(getRange);
			let getvalue = newArray[indexPath.row]
			var getItemName = getvalue.item
			let wordToRemove = "E-Waste | "
			if let range = getItemName.range(of: wordToRemove){
				getItemName.removeSubrange(range)
				
			}
			cell.lblTitle.text = getItemName
			
			cell.lblPrice.text = getvalue.rate
             cell.imgMaterialType.image = UIImage(named: "\(getvalue.item)")

			
		} else if self.title == "Metals"{
			let getRange = getArrayResult.suffix(14)
			//print("GET RANGE : \(getRange)")
			let newArray = Array(getRange);
			let getvalue = newArray[indexPath.row]
			var getItemName = getvalue.item
			let wordToRemove = "Metals | "
			if let range = getItemName.range(of: wordToRemove){
				getItemName.removeSubrange(range)
				
			}
			
			cell.lblTitle.text = getItemName
			cell.lblPrice.text = getvalue.rate
			 cell.imgMaterialType.image = UIImage(named: "\(getvalue.item)")
		}
		cell.contentView.backgroundColor = self.view.backgroundColor
		
		return cell
	}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var selected = indexPath.row
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTypeCell", for: indexPath) as! HomeTypeCell
        if(selected == 0){
            print("selected")
            cell.btnAdd.setTitle("ADDING", for: UIControlState.normal)
        }
      
        
    }
    
}
