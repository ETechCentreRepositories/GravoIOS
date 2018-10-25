//
//  ChildPageVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 17/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import Alamofire
import GMStepper



class ChildPageVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
	var getArrayResult : [Result] = []
	//	var getItemNamePaper = [String]()
	//	var getItemNameEWaste = [String]()
	//	var getItemNameMetals = [String]()
	var getIdPaper = [Int]()
	var getRatePaper = [Double]()
	var getIdMetals = [Int]()
	var getRateMetals = [Double]()
	var getIdEwaste = [Int]()
	var getRateEwaste = [Double]()
	
	let URL_ADDTOCART = "http://ehostingcentre.com/gravo/addcartdetails.php"
	
	
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
		let getresult = defaultvalue.array(forKey: "getresult")!
		
//		print("GET RESULT : \(getresult)")
//        print("Paper : \(getresult![0...3].count)")
//        print("E-Waste : \(getresult[12...15])")
//////
//////
//			print("Metals : \(getresult![4...11])")
//
		if(self.title == "PAPER"){
            
			return getresult[0...3].count
			
		} else if(self.title == "E-WASTE") {
			return  getresult[12...15].count
		}
		else if(self.title == "METALS"){
			return  getresult[4...11].count
			
		}
		return getresult.count
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
		
		var getrate = getCell.rate
		//print(getrate)
		let wordToRemoveKG = "/KG"
		if let range = getrate.range(of: wordToRemoveKG){
			getrate.removeSubrange(range)
		}
		
		let convertToIntRate = Double(getrate)
		//print(convertToIntRate!)
		let convertToInt = Int(getCell.id)
		
		getIdPaper.append(convertToInt!)
		getRatePaper.append(convertToIntRate!)
		
		
		if self.title  == "E-WASTE"{
			
			let getRange = getArrayResult.suffix(4)
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
			
			var getrate = getvalue.rate
			//print(getrate)
			let wordToRemoveKG = "/KG"
			if let range = getrate.range(of: wordToRemoveKG){
				getrate.removeSubrange(range)
			}
			
			let convertToIntRate = Double(getrate)
			let convertToInt = Int(getvalue.id)
			getRateEwaste.append(convertToIntRate!)
			getIdEwaste.append(convertToInt!)
//			print("E-WASTE RATE : \(convertToIntRate!)")
//			print("E-WASTE ID: \(convertToInt!)")
			cell.imgMaterialType.image = UIImage(named: "\(getvalue.item)")
			
			
		} else if self.title == "METALS"{
			let getRange = getArrayResult.suffix(12)
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
			
			var getrate = getvalue.rate
			//print(getrate)
			let wordToRemoveKG = "/KG"
			if let range = getrate.range(of: wordToRemoveKG){
				getrate.removeSubrange(range)
			}
			
			let convertToIntRate = Double(getrate)
			let convertToInt = Int(getvalue.id)
			getRateMetals.append(convertToIntRate!)
			getIdMetals.append(convertToInt!)
//			print("Metals RATE : \(convertToIntRate!)")
//			print("Metals ID: \(convertToInt!)")
		}
		cell.contentView.backgroundColor = self.view.backgroundColor
		
		cell.btnAdd.tag = indexPath.row
		cell.stepper.tag = indexPath.row
		
		cell.stepper.addTarget(self, action: #selector(ChildPageVC.stepperValueChanged(_:)), for: .valueChanged)
		cell.btnAdd.addTarget(self, action: #selector(ChildPageVC.buttonClicked(_:)), for: UIControlEvents.touchUpInside)
		
		return cell
	}
	
	var getStepper = 0;
	//get the stepper function
	@objc func stepperValueChanged(_ stepper: GMStepper){
		// print(stepper.value)
		getStepper = Int(stepper.value)
	}
	
	
	@IBAction func buttonClicked(_ sender: UIButton){
		let buttonRow = sender.tag
		
		//print(" GET BUTTON ROW:  \(buttonRow)")
		if(getStepper == 0){
			let alert = UIAlertController(title: "Alert!!!", message: "The item is empty", preferredStyle: UIAlertControllerStyle.alert)
			alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
			
			self.present(alert, animated: true, completion: nil)
		}else {
			var getuserId = defaultvalue.value(forKey: "id")!
			print("GET USER ID : \(getuserId)")
			
			
			if(self.title == "PAPER"){
				
				
				if(buttonRow == 0){
					
					//userid=55&weight=1&price=0.15&category=14
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRatePaper[0] ,
						"category":getIdPaper[0],
					]
					print(parameters)
					
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
					
					
					print("GET WEIGHT : \(getStepper)")
					print("GET ID : \(getIdPaper[0])");
					print("GET Rate : \(getRatePaper[0])")
					
					
					
					
				}else if(buttonRow == 1){
					
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRatePaper[1] ,
						"category":getIdPaper[1],
						]
					print(parameters)
					
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
					
					
					print("GET WEIGHT : \(getStepper)")
					print("GET ID : \(getIdPaper[1])");
					print("GET Rate : \(getRatePaper[1])")
					
					//				print(getItemNamePaper[1])
					
				} else if(buttonRow == 2){
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRatePaper[2] ,
						"category":getIdPaper[2],
						]
					print(parameters)
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
					
					
					print("GET WEIGHT : \(getStepper)")
					print("GET ID : \(getIdPaper[2])");
					print("GET Rate : \(getRatePaper[2])")
					
					//				print(getItemNamePaper[2])
				} else{
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRatePaper[3] ,
						"category":getIdPaper[3],
						]
					print(parameters)
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
					
					print("GET WEIGHT : \(getStepper)")
					print("GET ID : \(getIdPaper[3])");
					print("GET Rate : \(getRatePaper[3])")
					
					//print(getItemNamePaper[3])
				}
				
			} else if(self.title == "E-WASTE"){
				
				if(buttonRow == 0){
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRateEwaste[0] ,
						"category":getIdEwaste[0],
						]
					print(parameters)
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
					
					
					print("GET WEIGHT : \(getStepper)")
					print("GET ID : \(getIdEwaste[0])");
					print("GET Rate : \(getRateEwaste[0])")
					
					
				} else if(buttonRow == 1){
					
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRateEwaste[1] ,
						"category":getIdEwaste[1],
						]
					print(parameters)
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
					print("GET WEIGHT : \(getStepper)")
					print("GET ID : \(getIdEwaste[1])");
					print("GET Rate : \(getRateEwaste[1])")
				} else if(buttonRow == 2){
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRateEwaste[2] ,
						"category":getIdEwaste[2],
						]
					print(parameters)
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
					
					
					print("GET WEIGHT : \(getStepper)")
					print("GET ID : \(getIdEwaste[2])");
					print("GET Rate : \(getRateEwaste[2])")
				} else if(buttonRow == 3){
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRateEwaste[3] ,
						"category":getIdEwaste[3],
						]
					print(parameters)
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
					print("GET WEIGHT : \(getStepper)")
					print("GET ID : \(getIdEwaste[3])");
					print("GET Rate : \(getRateEwaste[3])")
				} else if(buttonRow == 4){
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRateEwaste[4] ,
						"category":getIdEwaste[4],
						]
					print(parameters)
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
					print("GET WEIGHT : \(getStepper)")
					print("GET ID : \(getIdEwaste[4])");
					print("GET Rate : \(getRateEwaste[4])")
				} else{
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRateEwaste[5] ,
						"category":getIdEwaste[5],
						]
					print(parameters)
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
					print("GET WEIGHT : \(getStepper)")
					print("GET ID : \(getIdEwaste[5])");
					print("GET Rate : \(getRateEwaste[5])")
				}
				
			} else if (self.title == "METALS" ){
				if(buttonRow == 0){
					print("get metals");
					
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRateMetals[0] ,
						"category":getIdMetals[0],
						]
					print(parameters)
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
					
					print("GET WEIGHT : \(getStepper)")
					print("GET ID : \(getIdMetals[0])");
					print("GET Rate : \(getRateMetals[0])")
					
				} else if(buttonRow == 1){
					
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRateMetals[1] ,
						"category":getIdMetals[1],
						]
					print(parameters)
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
					print("GET WEIGHT : \(getStepper)")
					print("GET ID : \(getIdMetals[1])");
					print("GET Rate : \(getRateMetals[1])")
					
					
				} else if(buttonRow == 2){
					
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRateMetals[2] ,
						"category":getIdMetals[2],
						]
					print(parameters)
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
				} else if(buttonRow == 3){
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRateMetals[3] ,
						"category":getIdMetals[3],
						]
					print(parameters)
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
				} else if(buttonRow == 4){
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRateMetals[4] ,
						"category":getIdMetals[4],
						]
					print(parameters)
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
				}else if(buttonRow == 5){
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRateMetals[5] ,
						"category":getIdMetals[5],
						]
					print(parameters)
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
				} else if(buttonRow == 6){
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRateMetals[6] ,
						"category":getIdMetals[6],
						]
					print(parameters)
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
				} else{
					let parameters: Parameters = [
						"userid" : getuserId,
						"weight" : getStepper,
						"price"  : getRateMetals[7] ,
						"category":getIdMetals[7],
						]
					print(parameters)
					Alamofire.request(URL_ADDTOCART,method: .post, parameters: parameters).responseJSON{
						response in
						print(response)
						
						
					}
				}
				
			}
			
		}
	}
	
}




