//
//  LoginActionVC.swift
//  GravosCollector
//
//  Created by Abhijit on 15/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class LoginActionVC: UIViewController {

    @IBOutlet weak var txtUsername: TextViewWithLeftImage!
    @IBOutlet weak var txtPassword: TextViewWithLeftImage!
	
    @IBOutlet weak var imgTest: UIImageView!
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        txtUsername.attributedPlaceholder = NSAttributedString(string: .placeEmail,
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.gray])
        txtPassword.attributedPlaceholder = NSAttributedString(string: .placePass,
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.gray])
		self.navigationController?.navigationBar.barTintColor = UIColor.white
		
		
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

    @IBAction func performLogin(_ sender: Any)
    {
		
		let objDataHandler = DataHandler()
		
		if let emailvalue = self.txtUsername.text
		{
			if let passwordValue = self.txtPassword.text
			{
				objDataHandler.postRemoteData(inputAddress: Constants.kLogin, inputParameters: ["email":emailvalue,"password":passwordValue], completion:
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
		}
		
        //Helper.showLoader(onView: self.view)
        // Helper.hideLoader(fromView: self.view)
    }
    
    @IBAction func dismissViewController(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
       
    }
	
	/*
	let toolbar = UIToolbar()
	toolbar.sizeToFit()

	let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(performLogin))
	
	toolbar.setItems([doneButton], animated: false)
	//txtUsername.textInputMode = UITextInputMode.
	txtUsername.inputAccessoryView = toolbar
	txtUsername.inputView = datePicker
	*/
}
