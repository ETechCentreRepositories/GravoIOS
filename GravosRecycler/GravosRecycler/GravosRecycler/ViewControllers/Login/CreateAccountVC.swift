//
//  CreateAccountVC.swift
//  GravosCollector
//
//  Created by Abhijit on 16/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import GMStepper
import GooglePlaces
import Alamofire

class CreateAccountVC: UIViewController,UITextFieldDelegate
{
    
    let URL_USER_REGISTER = "http://ehostingcentre.com/gravo/signup.php";
    
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
        
        txtaddress.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchTapped(_:)))
        self.txtaddress.addGestureRecognizer(tap)
    }
    
    
    @objc func touchTapped(_ sender: UITapGestureRecognizer){
        print("address text field enter")
        
        let touchTapped = GMSAutocompleteViewController()
        touchTapped.delegate = self
        UINavigationBar.appearance().barTintColor = UIColor.darkGray
        UINavigationBar.appearance().tintColor = UIColor.white
        
        let filter = GMSAutocompleteFilter()
        filter.type = .noFilter
        //filter.type = .establishment
        filter.country = "SG"
        touchTapped.autocompleteFilter = filter
        present(touchTapped, animated: true, completion: nil)
        
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
        
        let parameters  = [
            
            "email":txtEmail.text!,
            "firstname": txtFirstName.text!,
            "lastname": txtLastName.text!,
            "password": txtPassword.text!,
            "contactnumber": txtContactNumber.text!,
            "address": txtaddress.text!,
            ]
        print("Parameters : \(parameters)")
        
        
        if self.isTermsChecked == true{
            if(self.txtEmail.text! != "" && self.txtFirstName.text! != "" && self.txtLastName.text! != "" && self.txtContactNumber.text! != "" && self.txtaddress.text! != ""){
                if(self.isValidEmail(testStr: self.txtEmail.text!)){
                    if(self.isValidName(self.txtFirstName.text!) && self.isValidName(self.txtLastName.text!)){
                        Alamofire.request(URL_USER_REGISTER,method: .post,parameters:parameters).validate().responseJSON{
                            response in
                            
                            print(" Response JSON : \(response)")
                            
                            
                        }
                        
                        
                        
                        
                    }
                        //wrong name
                    else{
                        let alert = UIAlertController(title: "Alert!!!", message: "Invalid Name", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                    
                }else{
                    //wrong email
                    let alert = UIAlertController(title: "Alert!!!", message: "Invalid Email", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
            } else {
                //empty field
                let alert = UIAlertController(title: "Alert!!!", message: "Please Enter Your Details", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        } else {
            //uncheck term and condition
            let alert = UIAlertController(title: "Alert!!!", message: "Please Read and Accept Our Terms and Conditions", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
        
        
        
        //Abijit Code
        //        var dictParameters = [String : String]()
        //
        //        if self.txtEmail.text != "" && self.txtFirstName.text != "" && self.txtLastName.text != ""
        //        {
        //            if self.txtPassword.text != ""
        //            {
        //                dictParameters[UserResponseKeys.firstname.rawValue] = self.txtFirstName.text!
        //                dictParameters[UserResponseKeys.lastname.rawValue]    = self.txtLastName.text!
        //                dictParameters[UserResponseKeys.email.rawValue]        = self.txtEmail.text!
        //                dictParameters[UserResponseKeys.contact.rawValue]    = self.txtContactNumber.text!
        //                dictParameters[UserResponseKeys.address.rawValue]    = self.txtaddress.text!
        //                dictParameters[UserResponseKeys.password.rawValue]    = self.txtPassword.text!
        //
        //                /*dictParameters[UserResponseKeys.firstname.rawValue] = "Jon"
        //                dictParameters[UserResponseKeys.lastname.rawValue]    = "Yo"
        //                dictParameters[UserResponseKeys.email.rawValue]        = "Jon@jony.com"
        //                dictParameters[UserResponseKeys.contact.rawValue]    = "12345678"
        //                dictParameters[UserResponseKeys.address.rawValue]    = "States"
        //                dictParameters[UserResponseKeys.password.rawValue]    = "password"*/
        //                let objDataHandler = DataHandler()
        //
        //                objDataHandler.postRemoteData(inputAddress: Constants.kSignup, inputParameters: dictParameters, completion:
        //                    {result  in
        //
        //                        print(result)
        //                        //show alert
        //
        //                })
        //            }
        //        }
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
            txtPassword.becomeFirstResponder()
            break
        case txtPassword:
            txtContactNumber.becomeFirstResponder()
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
    
    
    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    func isValidName(_ nameString: String) -> Bool {
        
        var returnValue = true
        let mobileRegEx =  "[A-Za-z]"  // {3} -> at least 3 alphabet are compulsory.
        
        do {
            let regex = try NSRegularExpression(pattern: mobileRegEx)
            let nsString = nameString as NSString
            let results = regex.matches(in: nameString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    
}

extension CreateAccountVC: GMSAutocompleteViewControllerDelegate{
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        txtaddress.text! = place.formattedAddress!
        
        print("Place name: \(place.name)")
        print("Place address: \(String(describing: place.formattedAddress!))")
        print("Place attributions: \(place.attributions)")
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}


