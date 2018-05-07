//
//  LeaderBoardVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 19/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class LeaderBoardVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
   
    @IBOutlet weak var lblHead: UILabel!
    @IBOutlet weak var subViwImageCover: UIView!
    @IBOutlet weak var viwImageCover: UIView!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnInvite: UIButton!
    @IBOutlet weak var lblRank: UILabel!
    @IBOutlet weak var lblGravoPoints: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var tblLeaderBoard: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }

    override func viewDidDisappear(_ animated: Bool)
    {
        
    }
    override func viewWillAppear(_ animated: Bool)
    {
        
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
		self.btnShare.layer.cornerRadius = 10
		self.btnInvite.layer.cornerRadius = 10
	
		self.viwImageCover.addDiamondMask(cornerRadius: 1)
		subViwImageCover.addDiamondMask(cornerRadius: 1)
		imgProfile.addDiamondMask(cornerRadius: 1)
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderBoardCell", for: indexPath) as! LeaderBoardCell
        cell.viwProgress.layer.cornerRadius = 10
        return cell
    }
    
    @IBAction func performShare(_ sender: Any) {
    }
   
    @IBAction func performInvite(_ sender: Any) {
    }
}
