//
//  TNCAccount.swift
//  GravosRecycler
//
//  Created by Abhijit on 7/5/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class TNCAccount: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func viewWillAppear(_ animated: Bool)
	{
		self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
		self.navigationController?.navigationBar.barTintColor = Constants.themeGreen
		self.showAnimate()
	}

	func showAnimate()
	{
		self.view.transform =  CGAffineTransform(scaleX: 1.3, y: 1.3)
		self.view.alpha = 0.0
		UIView.animate(withDuration: 0.2, animations: {
			self.view.alpha = 1.0
			self.view.transform =  CGAffineTransform(scaleX: 1.0, y: 1.0)
		}, completion:{(finished : Bool) in
			if(finished)
			{
				//self.view.removeFromSuperview()
			}
		})
	}
	
	func removeAnimate()
	{
		UIView.animate(withDuration: 0.2, animations: {
			self.view.alpha = 1.0
			self.view.transform =  CGAffineTransform(scaleX: 1.3, y: 1.3)
		}, completion:{(finished : Bool) in
			if(finished)
			{
				self.view.removeFromSuperview()
			}
		})
	}
	
	@IBAction func submitAddItem(_ sender: Any)
	{
		self.removeAnimate()
	}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
