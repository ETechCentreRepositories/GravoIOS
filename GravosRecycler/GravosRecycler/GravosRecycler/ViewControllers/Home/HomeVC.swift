//
//  HomeVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 10/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import ENSwiftSideMenu
class HomeVC: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,ENSideMenuDelegate
{
    
    @IBOutlet weak var colViwHome: UICollectionView!

    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    var arrTypeOfMaterials = ["PAPER","METALS","E-WASTE","BIG ITEMS"]
    var arrPaymentOpt = ["Gravo rewards you", "Gravos quotes you"]
    
    var isMenuOpen      = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
		addSlideMenuButton()
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        self.sideMenuController()?.sideMenu?.delegate = self
		
		//get categories
		self.getCategories()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/2, height: screenHeight/2.7)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        colViwHome!.collectionViewLayout = layout
        
        
        let logo = UIImage(named: "NavLogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

	func getCategories()
	{
		let objDataHandler = DataHandler()
		
		objDataHandler.fetchRemoteData(inputAddress: Constants.kCategory, completion:
					{result  in
						if let response = result as? LoggedInUsers
						{
							if response.errormessage == ""
							{
								print(response.firstname)
								//do db operation
								
								if let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "MyNavigationController")
								{
									self.present(homeVC, animated: true)
								}
							}
							else
							{
								//show error message
							}
						}
						
						
				})
		
	}
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 4
    }
    
   /* func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let size = CGSize(width: collectionView.bounds.size.width/3 - 10, height: collectionView.bounds.size.height/3 - 10)
        return size
    }*/
    
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
	{
		if let homeCell = cell as? HomeCollCell
		{
			cell.backgroundColor = UIColor.white
			
			if (indexPath.row == 0)
			{
				homeCell.imgCellType.image = UIImage(named: "Icon_Paper")
				homeCell.imgCellType.backgroundColor = Constants.themeYellow
			}
			if (indexPath.row == 1)
			{
				homeCell.imgCellType.image = UIImage(named: "Icon_Screws")
				homeCell.imgCellType.backgroundColor = Constants.themeOrange
			}
			if (indexPath.row == 2)
			{
				homeCell.imgCellType.image = UIImage(named: "Icon_EWaste")
				homeCell.imgCellType.backgroundColor = Constants.themePurple
				
			}
			if (indexPath.row == 3)
			{
				homeCell.imgCellType.image = UIImage(named: "Icon_BulkItems")
				homeCell.lblCellSubTitle.textColor = UIColor.red
				homeCell.imgCellType.backgroundColor = UIColor.cyan
			}
		}
		
	}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .homecell, for: indexPath) as! HomeCollCell
		
        if (indexPath.row == 0)
        {
            cell.lblCellTitle.text = arrTypeOfMaterials[indexPath.row]
            cell.lblCellSubTitle.text = arrPaymentOpt[0]
            return cell
        }
        if (indexPath.row == 1)
        {
            cell.lblCellTitle.text = arrTypeOfMaterials[indexPath.row]
            cell.lblCellSubTitle.text = arrPaymentOpt[0]
            return cell
        }
        if (indexPath.row == 2)
        {
            cell.lblCellTitle.text = arrTypeOfMaterials[indexPath.row]
            cell.lblCellSubTitle.text = arrPaymentOpt[0]
            return cell
            
        }
        if (indexPath.row == 3)
        {
            cell.lblCellTitle.text = arrTypeOfMaterials[indexPath.row]
            cell.lblCellSubTitle.text = arrPaymentOpt[1]
            return cell
        }
        return cell
    }
	
	//------------------
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if self.isMenuOpen
        {
             toggleSideMenuView()
        }
        else
        {
            let pagingVC = self.storyboard?.instantiateViewController(withIdentifier: .pagingVC) as! PagingVC
            
            pagingVC.selecedIndex = indexPath.row
            
            self.navigationController?.pushViewController(pagingVC, animated: true)
        }
        
    }
	
	//-------------------
    @IBAction func showMenu(_ sender: Any)
    {
        toggleSideMenuView()
    }
    
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        print("sideMenuShouldOpenSideMenu")
        return true
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
        isMenuOpen = false
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
        isMenuOpen = true
    }
    
}
