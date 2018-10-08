//
//  PagingVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 17/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import Parchment

class PagingVC: UIViewController
{

    
    var selecedIndex = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool)
    {
		self.setupPagingVC()
		self.customiseUserInterface()
		
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
	
	func setupPagingVC()
	{
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let firstViewController = storyboard.instantiateViewController(withIdentifier: "ChildPageVC")
		let secondViewController = storyboard.instantiateViewController(withIdentifier: "ChildPageVC")
		let thirdViewController = storyboard.instantiateViewController(withIdentifier: "ChildPageVC")
		let forthViewController = storyboard.instantiateViewController(withIdentifier: "BulkChildVC")
		
		
		firstViewController.title   = "Paper"
		secondViewController.title  = "Metals"
		thirdViewController.title   = "E-Waste"
		
		firstViewController.view.backgroundColor    = Constants.themeYellow
		secondViewController.view.backgroundColor   = Constants.themeOrange
		thirdViewController.view.backgroundColor    = Constants.themePurple
		forthViewController.view.backgroundColor    = UIColor.white
		
		
		let pagingViewController = FixedPagingViewController(viewControllers: [
			firstViewController,
			secondViewController,
			thirdViewController,
			forthViewController
			])
		
		// controller and contrain it to the edges of the view.
		
		pagingViewController.textColor = UIColor.black
		pagingViewController.selectedTextColor = Constants.themePurple
		pagingViewController.font = UIFont(name: .quicksandReg, size: 30)!
		pagingViewController.selectedFont = UIFont(name: .quicksandReg, size: 30)!
		pagingViewController.borderColor = UIColor.gray
		
		addChildViewController(pagingViewController)
		view.addSubview(pagingViewController.view)
		view.constrainToEdges(pagingViewController.view)
		
		pagingViewController.didMove(toParentViewController: self)
		
		pagingViewController.select(index: selecedIndex)
	}
	
	
	func customiseUserInterface()
	{
		let sideMenu  = UIBarButtonItem(image: UIImage(named:"BackArrow"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.toggleSideMenu(_:)))
		sideMenu.tintColor = UIColor.black
		self.navigationItem.leftBarButtonItem = sideMenu
		//----------------------------
		let help  = UIBarButtonItem(image: UIImage(named:"Icon_Help"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.showHelp(_:)))
		help.tintColor = UIColor.black
		//----------------------------
		let cart  = UIBarButtonItem(image: UIImage(named:"Icon_Cart"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.showCart(_:)))
		help.tintColor = UIColor.black
		self.navigationItem.rightBarButtonItems = [cart,help]
		
		self.navigationItem.setHidesBackButton(true, animated: true)
		
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
    @IBAction func dismissVC(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
}
