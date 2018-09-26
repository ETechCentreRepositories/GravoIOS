//
//  MenuViewController.swift
//  GravosRecycler
//
//  Created by Ivan Lipotan on 25/9/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
protocol  SlideMenuDelegate {
	func slideMenuItemSelectedAtIndex(_ index : Int32)
}


class MenuViewController: UIViewController{
    
    @IBOutlet weak var txtName: UILabel!
    var btnMenu: UIButton!
    var delegate : SlideMenuDelegate?
	override func viewDidLoad() {
		super.viewDidLoad()
        
        let defaultValues = UserDefaults.standard
        if let getFullname = defaultValues.string(forKey: "full_name"){
            txtName.text = getFullname
        }
		
	}
    @IBOutlet weak var btnCloseMenuOverlay: UIButton!
    
    
    @IBOutlet weak var btnCloseTapped: UIButton!
    

    @IBAction func btnClosedTapped(_ sender: UIButton) {
        
        
        btnMenu.tag = 0
        btnMenu.isHidden = false
        
        if(self.delegate != nil){
            var index = Int32(sender.tag)
            if(sender ==  self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        UIView.animate(withDuration: 0.3, animations: {
            () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        },completion:{(finished) ->Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        })
    }
    
}
