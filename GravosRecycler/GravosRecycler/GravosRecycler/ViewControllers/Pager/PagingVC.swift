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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstViewController = storyboard.instantiateViewController(withIdentifier: "ChildPageVC")
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "ChildPageVC")
        let thirdViewController = storyboard.instantiateViewController(withIdentifier: "ChildPageVC")
        let forthViewController = storyboard.instantiateViewController(withIdentifier: "BulkChildVC")
        
        
        firstViewController.title   = "Paper"
        secondViewController.title  = "E-Waste"
        thirdViewController.title   = "Metals"
        forthViewController.title   = "Bulk Items"
        
        firstViewController.view.backgroundColor    = Constants.themeYellow
        secondViewController.view.backgroundColor   = UIColor(red: 107/255, green: 69/255, blue: 163/255, alpha: 1)
        thirdViewController.view.backgroundColor    = UIColor(red: 244/255, green: 96/255, blue: 46/255, alpha: 1)
        forthViewController.view.backgroundColor    = UIColor.white
        
        
        let pagingViewController = FixedPagingViewController(viewControllers: [
            firstViewController,
            secondViewController,
            thirdViewController,
            forthViewController
            ])
        
        // controller and contrain it to the edges of the view.
        
        pagingViewController.textColor = UIColor(red: 95/255, green: 102/255, blue: 108/255, alpha: 1)
        pagingViewController.selectedTextColor = UIColor(red: 117/255, green: 111/255, blue: 216/255, alpha: 1)
        pagingViewController.font = UIFont(name: "Quicksand", size: 30)!
        pagingViewController.selectedFont = UIFont(name: "Quicksand", size: 30)!
        pagingViewController.borderColor = UIColor.gray
        
        addChildViewController(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        
        pagingViewController.didMove(toParentViewController: self)
        
        pagingViewController.select(index: selecedIndex)
        
        let sideMenu  = UIBarButtonItem(image: UIImage(named:"BackArrow"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.toggleSideMenu(_:)))
        sideMenu.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = sideMenu
       
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
