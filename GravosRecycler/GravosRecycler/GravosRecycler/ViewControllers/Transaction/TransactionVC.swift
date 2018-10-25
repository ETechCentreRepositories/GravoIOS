//
//  TransactionVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 19/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class TransactionVC: BaseViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource
{
    
    
    @IBOutlet weak var tblTransactionlist: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
       addSlideMenuButton()
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationItem.setHidesBackButton(true, animated: true)
        
        let help  = UIBarButtonItem(image: UIImage(named:"Icon_Help"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.showHelp(_:)))
        help.tintColor = UIColor.black
		
		let cart  = UIBarButtonItem(image: UIImage(named:"Icon_Cart"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.showCart(_:)))
		help.tintColor = UIColor.black
		self.navigationItem.rightBarButtonItems = [cart,help]
		
        self.navigationItem.setHidesBackButton(true, animated: true)
		
    }
    
    @objc func toggleSideMenu(_ sender: Any)
    {
        toggleSideMenuView()
    }
    
    @objc func showHelp(_ sender: Any)
    {
        if let helpVC = self.storyboard?.instantiateViewController(withIdentifier: "HelpVC")
        {
            self.navigationController?.pushViewController(helpVC, animated: true)
        }
    }
	
	
	@objc func showCart(_ sender: Any)
	{
		if let helpVC = self.storyboard?.instantiateViewController(withIdentifier: "CartVC")
		{
			self.navigationController?.pushViewController(helpVC, animated: true)
		}
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

    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {

        return 1
    }
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0
        {
            return "Transaction: #0334564458"
        }
        else
        {
            return "Transaction: #0337896865"
        }
    }*/
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionListCell", for: indexPath) as! TransactionListCell
        
      
        
        if indexPath.section == 0
        {
            cell.contentView.backgroundColor = UIColor.white
            cell.btnStatus.setTitle("WAITING FOR COLLECTION", for: .normal)
            cell.btnStatus.backgroundColor = UIColor.lightGray
            cell.btnStatus.setTitleColor(UIColor.white, for: .normal)
			
            
        }
        else
        {
            cell.contentView.backgroundColor = Constants.themeGreen
            cell.btnStatus.setTitle("Completed", for: .normal)
            cell.btnStatus.backgroundColor = UIColor.white
            cell.btnStatus.setTitleColor(Constants.themeGreen, for: .normal)
//            cell.lblScheduleDate.text = "20 Apr 2018"
           
        }
        
        cell.bottomView.backgroundColor = cell.contentView.backgroundColor
       
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let transactionDetails = self.storyboard?.instantiateViewController(withIdentifier: "TransactionDetails")
        {
            self.navigationController?.pushViewController(transactionDetails, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TransItemImagesColCell", for: indexPath) as! TransItemImagesColCell
        
        
        return cell
    }
}
