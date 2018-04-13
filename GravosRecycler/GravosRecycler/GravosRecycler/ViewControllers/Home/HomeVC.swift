//
//  HomeVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 10/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import ENSwiftSideMenu
class HomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,ENSideMenuDelegate
{
    
    @IBOutlet weak var colViwHome: UICollectionView!

    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    var arrTypeOfMaterials = ["Paper","Metals","E-Waste","Bulk Items"]
    var arrPaymentOpt = ["Get Paid", "Pay Us"]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        self.sideMenuController()?.sideMenu?.delegate = self
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
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 4
    }
    
   /* func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let size = CGSize(width: collectionView.bounds.size.width/3 - 10, height: collectionView.bounds.size.height/3 - 10)
        return size
    }*/
    
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollCell", for: indexPath) as! HomeCollCell
        
        if (indexPath.row == 0)
        {
            cell.imgCellType.image = UIImage(named: "Icon_Paper")
            cell.lblCellTitle.text = arrTypeOfMaterials[indexPath.row]
            cell.lblCellSubTitle.text = arrPaymentOpt[0]
            cell.backgroundColor = Constants.themeYellow
        }
        if (indexPath.row == 1)
        {
            cell.imgCellType.image = UIImage(named: "Icon_Screws")
            cell.lblCellTitle.text = arrTypeOfMaterials[indexPath.row]
            cell.lblCellSubTitle.text = arrPaymentOpt[0]
            cell.backgroundColor = UIColor.orange
        }
        if (indexPath.row == 2)
        {
            cell.imgCellType.image = UIImage(named: "Icon_EWaste")
            cell.lblCellTitle.text = arrTypeOfMaterials[indexPath.row]
            cell.lblCellSubTitle.text = arrPaymentOpt[0]
            cell.backgroundColor = UIColor.purple
        }
        if (indexPath.row == 3)
        {
            cell.imgCellType.image = UIImage(named: "Icon_BulkItems")
            cell.lblCellTitle.text = arrTypeOfMaterials[indexPath.row]
            cell.lblCellSubTitle.text = arrPaymentOpt[1]
            cell.lblCellSubTitle.textColor = UIColor.red
            cell.backgroundColor = UIColor.cyan
        }
        
        cell.contentView.layer.shadowColor = UIColor.black.cgColor
        cell.contentView.layer.shadowOpacity = 1
        cell.contentView.layer.shadowOffset = CGSize.zero
        cell.contentView.layer.shadowRadius = 10
        
        return cell
    }
    
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
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }
}
