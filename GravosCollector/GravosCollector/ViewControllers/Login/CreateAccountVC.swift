//
//  CreateAccountVC.swift
//  GravosCollector
//
//  Created by Abhijit on 16/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import GMStepper

class CreateAccountVC: UIViewController,UITextFieldDelegate
{

    @IBOutlet weak var txtEmail: TextViewWithLeftImage!
    @IBOutlet weak var txtFirstName: TextViewWithLeftImage!
    @IBOutlet weak var txtLastName: TextViewWithLeftImage!
    @IBOutlet weak var txtContactNumber: TextViewWithLeftImage!
    @IBOutlet weak var txtNRIC: TextViewWithLeftImage!
    @IBOutlet weak var txtPassword: TextViewWithLeftImage!
    @IBOutlet weak var txtVehicleNumber: TextViewWithLeftImage!
    @IBOutlet weak var imgViwCheckMark: UIImageView!
    @IBOutlet weak var txtViewContent: UIScrollView!
    
    var isTermsChecked = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.customiseUserInterface()
        self.navigationController?.navigationBar.barTintColor = UIColor.black
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

    func customiseUserInterface()
    {
        self.txtEmail.delegate = self
        self.txtFirstName.delegate = self
        self.txtLastName.delegate = self
        self.txtPassword.delegate = self
        self.txtNRIC.delegate = self
        self.txtContactNumber.delegate = self
        self.txtVehicleNumber.delegate = self
    }
    
    
    @IBAction func dismissController(_ sender: Any)
    {
        self.dismiss(animated: true)
    }
    
    @IBAction func createAccount(_ sender: Any)
    {
        
         
        
    }
    
    
//    @IBAction func showTermsConditions(_ sender: Any)
//    {
//        self.txtViewContent.isHidden = false
//    }
//    
//    @IBAction func dismissTermsConditions(_ sender: Any)
//    {
//        self.txtViewContent.isHidden = true
//    }
    
    
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
            txtNRIC.becomeFirstResponder()
            break
        case txtNRIC:
            txtPassword.becomeFirstResponder()
            break
        case txtPassword:
            txtVehicleNumber.becomeFirstResponder()
            break
        default:
            textField.resignFirstResponder()
        }
       

        return true
    }
    
}
