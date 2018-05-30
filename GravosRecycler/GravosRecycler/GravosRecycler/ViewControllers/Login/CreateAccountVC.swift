//
//  CreateAccountVC.swift
//  GravosCollector
//
//  Created by Abhijit on 16/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController,UITextFieldDelegate
{

    @IBOutlet weak var txtEmail: TextViewWithLeftImage!
    @IBOutlet weak var txtFirstName: TextViewWithLeftImage!
    @IBOutlet weak var txtLastName: TextViewWithLeftImage!
    @IBOutlet weak var txtContactNumber: TextViewWithLeftImage!
    @IBOutlet weak var txtPassword: TextViewWithLeftImage!
	@IBOutlet weak var txtaddress: TextViewWithLeftImage!
    @IBOutlet weak var imgViwCheckMark: UIImageView!
    
    var isTermsChecked = false
    var activeField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.customiseUserInterface()
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(aNotification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(aNotification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func keyboardWillBeHidden(aNotification: NSNotification) {
        //let contentInsets: UIEdgeInsets = UIEdgeInsets.zero
       // self.txtViewContent.contentInset = contentInsets
        //self.txtViewContent.scrollIndicatorInsets = contentInsets
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeField = nil
    }
    
    @objc func keyboardWillShow(aNotification: NSNotification)
    {
        /*if let keyboardFrame: NSValue = aNotification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue
        {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let kbSize: CGSize =  keyboardRectangle.size
            let contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
            txtViewContent.contentInset = contentInsets
            txtViewContent.scrollIndicatorInsets = contentInsets
            var aRect: CGRect = self.view.frame
            aRect.size.height -= kbSize.height
            if !aRect.contains(activeField!.frame.origin) {
                self.txtViewContent.scrollRectToVisible(activeField!.frame, animated: true)
            }
             self.txtViewContent.scrollRectToVisible(activeField!.frame, animated: true)
        }*/
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func customiseUserInterface()
    {
        self.txtEmail.delegate = self
        self.txtFirstName.delegate = self
        self.txtLastName.delegate = self
        self.txtPassword.delegate = self
        self.txtContactNumber.delegate = self
    }
    
    
    @IBAction func dismissController(_ sender: Any)
    {
        self.dismiss(animated: true)
    }
    
    @IBAction func createAccount(_ sender: Any)
    {
		var dictParameters = [String : String]()
		
		if self.txtEmail.text != "" && self.txtFirstName.text != "" && self.txtLastName.text != ""
		{
			if self.txtPassword.text != ""
			{
				dictParameters[UserResponseKeys.firstname.rawValue] = self.txtFirstName.text!
				dictParameters[UserResponseKeys.lastname.rawValue]	= self.txtLastName.text!
				dictParameters[UserResponseKeys.email.rawValue]		= self.txtEmail.text!
				dictParameters[UserResponseKeys.contact.rawValue]	= self.txtContactNumber.text!
				dictParameters[UserResponseKeys.address.rawValue]	= self.txtaddress.text!
				dictParameters[UserResponseKeys.password.rawValue]	= self.txtPassword.text!
				
				/*dictParameters[UserResponseKeys.firstname.rawValue] = "Jon"
				dictParameters[UserResponseKeys.lastname.rawValue]	= "Yo"
				dictParameters[UserResponseKeys.email.rawValue]		= "Jon@jony.com"
				dictParameters[UserResponseKeys.contact.rawValue]	= "12345678"
				dictParameters[UserResponseKeys.address.rawValue]	= "States"
				dictParameters[UserResponseKeys.password.rawValue]	= "password"*/
				let objDataHandler = DataHandler()
				
				objDataHandler.postRemoteData(inputAddress: Constants.kSignup, inputParameters: dictParameters, completion:
					{result  in
						
						print(result)
						//show alert
						
				})
			}
		}
    }
    
    
    @IBAction func showTermsConditions(_ sender: Any)
    {
		let tnc = self.storyboard?.instantiateViewController(withIdentifier: "TNCAccount") as! TNCAccount
		//addItemVC.delegate = self
		self.addChildViewController(tnc)
		tnc.view.frame = self.view.frame
		self.view.addSubview((tnc.view)!)
		tnc.didMove(toParentViewController: self)
    }
    
    @IBAction func dismissTermsConditions(_ sender: Any)
    {
		
    }
    
    
    @IBAction func swapTCCheckMark(_ sender: Any)
    {
        if isTermsChecked == true
        {
            isTermsChecked = false
        }
        else
        {
            isTermsChecked = true
        }
         self.imgViwCheckMark.image = isTermsChecked == true ? UIImage(named: "Icon_Check") : UIImage(named: "Icon_Uncheck")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        
        switch textField
        {
        case txtEmail:
            txtFirstName.becomeFirstResponder()
            break
        case txtFirstName:
            txtLastName.becomeFirstResponder()
            break
        case txtLastName:
            txtContactNumber.becomeFirstResponder()
            break
        case txtContactNumber:
            txtPassword.becomeFirstResponder()
            break
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        //txtViewContent.setContentOffset(textField.bounds.origin, animated: true)
        return true
    }
    
}
