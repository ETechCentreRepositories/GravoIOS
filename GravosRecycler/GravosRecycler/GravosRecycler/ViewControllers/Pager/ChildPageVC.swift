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
		let totalArray = getresult!.count
//		print(getresult[0])
		if(self.title == "Paper"){
			return getresult![0...3].count
		} else if(self.title == "Metals"){
			return getresult![4...11].count
		} else {
			return getresult![12...18].count
		}
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTypeCell", for: indexPath) as! HomeTypeCell
		
		if self.title == "Paper"
		{
			cell.imgMaterialType.image = UIImage(named: "Icon_Newspaper")
			
		}
		else if self.title == "E-Waste"
		{
            cell.imgMaterialType.image = UIImage(named: "Icon_laptop")
		}
		else if self.title == "Metals"
		{
			cell.imgMaterialType.image = UIImage(named: "Icon_Brass")
		}
		else
		{
			cell.imgMaterialType.image = UIImage(named: "Icon_Newspaper")
		}
		cell.contentView.backgroundColor = self.view.backgroundColor
		
		return cell
	}
}
