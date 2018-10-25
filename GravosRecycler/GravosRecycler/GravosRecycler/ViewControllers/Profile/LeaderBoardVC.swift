//
//  LeaderBoardVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 19/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import Alamofire

class LeaderBoardVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
	
	var getLeaderBoardArray = [LeaderBoardItem]()
	var getAchNameArray = [String]()
	var getPointsArray = [String]()
	var getTotal = [String]()
	
	var userdefault = UserDefaults.standard
	
	
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblHead: UILabel!
	@IBOutlet weak var lblRank: UILabel!
	@IBOutlet weak var lblGravoPoints: UILabel!
	
	@IBOutlet weak var lblEmission: UILabel!
	
	@IBOutlet weak var lblValueEmission: UILabel!
	@IBOutlet weak var lblCarbon: UILabel!
	@IBOutlet weak var lblValueCarbon: UILabel!
	@IBOutlet weak var tblLeaderBoard: UITableView!
	@IBOutlet weak var lblValueReceived: UILabel!
	
	@IBOutlet weak var lbltotalkg: UILabel!
	
	@IBOutlet weak var lblreceived: UILabel!
	
	@IBOutlet weak var lblValueTotal: UILabel!
	
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad()
	{
		super.viewDidLoad()

        let urlImage = NSURL(string : UserDefaults.standard.value(forKey: "photo")! as! String)
        print(urlImage as Any)
        
        
        let data = NSData(contentsOf: urlImage! as URL)
        
        if data != nil{
            
            imgProfile.image = UIImage(data: data! as Data)
        }
        
		
		lblHead.text! = userdefault.value(forKey: "full_name") as! String
		lblGravoPoints.text! = userdefault.value(forKey: "total_points") as! String
		lblRank.text! = userdefault.value(forKey: "rank_name")as! String
		
        
	}
	
	override func viewWillAppear(_ animated: Bool)
	{
      
        //        let sumArray = UserDefaults.standard.array(forKey:"getArraySumLeader")!
        //
        //        return sumArray[0...2].count
        //        for i in getLeaderBoardArray{
        //
        //        }
		
		self.tblLeaderBoard.tableFooterView = UIView()
		
		let sideMenu  = UIBarButtonItem(image: UIImage(named:"BackArrow"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.toggleSideMenu(_:)))
		
		self.navigationItem.leftBarButtonItem = sideMenu
		self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
		self.navigationItem.leftBarButtonItem = sideMenu
		
		
		self.customiseUserInterface()
		
		self.navigationController?.navigationBar.barTintColor  = UIColor.black
		self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
		
	}
	
	
	func customiseUserInterface()
	{
		//-------
		//		self.btnShare.layer.cornerRadius = 10
		//		self.btnInvite.layer.cornerRadius = 10
		//
		//		self.viwImageCover.addDiamondMask(cornerRadius: 1)
		//		subViwImageCover.addDiamondMask(cornerRadius: 1)
		//		imgProfile.addDiamondMask(cornerRadius: 1)
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	@objc func toggleSideMenu(_ sender: Any)
	{
		self.navigationController?.popViewController(animated: true)
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
        
        
        let  getLeaderArray = userdefault.array(forKey: "getResultLeaderboard")!
		return getLeaderArray[0...2].count
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderBoardCell", for: indexPath) as! LeaderBoardCell
		
		
        let getresult = UserDefaults.standard.array(forKey: "getResultLeaderboard")!
        
                for getAllResult in getresult as![[String:Any]]{
        
                    let getAch_name = getAllResult["achievement_name"] as! String
                    //print(getAch_name)
                    self.getAchNameArray.append(getAch_name)
        
                    let getAch_id = getAllResult["achievements_id"]as! String
        
                    let getAch_rec_id = getAllResult["achievements_recycler_id"]as! String
                    let getcategory_id = getAllResult["category_id"]as! String
                    let getid = getAllResult["id"]as! String
        
                    let getpoints = getAllResult["points"]as! String
                    self.getPointsArray.append(getpoints)
        
        
                    let passtomodals = LeaderBoardItem(achievement_name: getAch_name, achievement_id: getAch_id, achievements_recycler_id: getAch_rec_id, category_id: getcategory_id, id: getid, points: getpoints)
        
                    self.getLeaderBoardArray.append(passtomodals)
        
        
        
        
                }
        
                let outputCell = self.getLeaderBoardArray[indexPath.row]

                cell.lblSerial.text = String(indexPath.row + 1)
                cell.lblGreenTitle.text = outputCell.achievement_name
                cell.progressBar.progress = Float(outputCell.points)!/100

                cell.imgGreenType.image = UIImage(named: "\(outputCell.achievement_name)")

                cell.lblpoints.text = "\(outputCell.points) points"
		
		
			self.lbltotalkg.text! = self.getAchNameArray[3]
			self.lblreceived.text! = self.getAchNameArray[4]
			self.lblEmission.text! = self.getAchNameArray[5]
			self.lblCarbon.text! = self.getAchNameArray[6]
			self.lblValueEmission.text! = self.getPointsArray[5]
			self.lblValueCarbon.text! =  self.getPointsArray[6]
			self.lblValueTotal.text! = "\(self.getPointsArray[3])KG"
			self.lblValueReceived.text! = self.getPointsArray[4]
		return cell
	}
	
}
