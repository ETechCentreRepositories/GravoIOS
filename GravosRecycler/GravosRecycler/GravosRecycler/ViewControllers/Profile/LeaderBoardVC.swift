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

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        
        self.tblLeaderBoard.tableFooterView = UIView()
        
        let sideMenu  = UIBarButtonItem(image: UIImage(named:"BackArrow"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.toggleSideMenu(_:)))
        sideMenu.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = sideMenu
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        self.btnShare.layer.cornerRadius = 10
        self.btnInvite.layer.cornerRadius = 10
        
        self.navigationItem.leftBarButtonItem = sideMenu
        
        viwImageCover.addDiamondMask(cornerRadius: 1)
        subViwImageCover.addDiamondMask(cornerRadius: 1)
        imgProfile.addDiamondMask(cornerRadius: 1)
        //imgProfile.layer.borderWidth = 3
        //imgProfile.layer.masksToBounds = false
        //imgProfile.layer.borderColor = UIColor.black.cgColor
        //imgProfile.clipsToBounds = true
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
