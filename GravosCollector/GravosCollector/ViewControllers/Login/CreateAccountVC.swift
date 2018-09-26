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
import GooglePlacePicker
import Alamofire
class CreateAccountVC: UIViewController,UITextFieldDelegate
{
    let URL_USER_REGISTER = "http://ehostingcentre.com/gravo/collectorsignup.php";
    @IBOutlet weak var txtEmail: TextViewWithLeftImage!
    @IBOutlet weak var txtFirstName: TextViewWithLeftImage!
    @IBOutlet weak var txtLastName: TextViewWithLeftImage!
    @IBOutlet weak var txtContactNumber: TextViewWithLeftImage!
    @IBOutlet weak var txtNRIC: TextViewWithLeftImage!
    @IBOutlet weak var txtPassword: TextViewWithLeftImage!
    @IBOutlet weak var txtVehicleNumber: TextViewWithLeftImage!
    @IBOutlet weak var imgViwCheckMark: UIImageView!
    @IBOutlet weak var txtViewContent: UIScrollView!
    @IBOutlet weak var licenseNumber: TextViewWithLeftImage!
    @IBOutlet weak var txtAddress: TextViewWithLeftImage!
    
    @IBOutlet weak var myView: UIView!
    var isTermsChecked = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        txtAddress.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchTapped(_:)))
        self.txtAddress.addGestureRecognizer(tap)
    }
    
    
    @objc func touchTapped(_ sender: UITapGestureRecognizer) {
        print("press button Tap")
        
        
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
    
    
    
    
    
    //
    //    @objc func handleTap(){
    //
    //    }
    
    
    //    @IBAction func searchAddressAction(_ sender: Any) {
    //        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchAddressVC") as? SearchAddressVC
    //        self.navigationController?.pushViewController(vc!, animated: true)
    //
    //    }
    //
    
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
        self.txtAddress.delegate = self
        self.licenseNumber.delegate = self
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
            "address": txtAddress.text!,
            "nric": txtNRIC.text!,
            "liscencenumber": licenseNumber.text!,
            "vehiclenumber" : txtVehicleNumber.text!,
            
            ]
        
        print(parameters)
        
        if self.isTermsChecked == true{
            if(self.txtEmail.text! != "" && self.txtFirstName.text! != "" && self.txtLastName.text! != "" && self.txtPassword.text! != "" && self.txtContactNumber.text! != "" && self.txtAddress.text! != "" && self.txtNRIC.text! != "" && self.licenseNumber.text! != "" && self.txtVehicleNumber.text! != ""){
                if(self.isValidEmail(testStr: self.txtEmail.text!)){
                    if(self.isValidName(self.txtFirstName.text!) && self.isValidName(self.txtLastName.text!)){
                        //                        guard let url = URL(string: URL_USER_REGISTER) else {return}
                        //                        var request = URLRequest(url: url)
                        //                        request.httpMethod = "POST"
                        //                        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                        //                        let postString = "email=\(txtEmail.text!)&firstname=\(txtFirstName.text!)&lastname=\(txtLastName.text!)&password=\(txtPassword.text!)&contactnumber=\(txtContactNumber.text!)&address=\(txtAddress.text!)&nric=\(txtNRIC.text!)&liscencenumber\(licenseNumber.text!)&vehiclenumber=\(txtVehicleNumber.text!)";
                        //
                        //                        print(postString);
                        //
                        //                        request.httpBody = postString.data(using: String.Encoding.utf8)
                        //
                        //                        URLSession.shared.dataTask(with: request, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) -> Void in
                        //                            if error != nil {
                        //                                print("fail")
                        //                                return
                        //                            }
                        //
                        //                            do {
                        //                                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                        //                                print ("1")
                        //
                        //                                if let parseJSON = json {
                        //
                        //                                    let userId = parseJSON["userId"] as? String
                        //                                    print ("2")
                        //                                    if( userId != nil) {
                        //
                        //                                    } else {
                        //                                        let errorMessage = parseJSON["message"] as? String
                        //                                        print ("3")
                        //                                    }
                        //                                }
                        //                            } catch{
                        //                                print(error)
                        //                            }
                        //                        }).resume()
                        //
                        //
                        //
                        //
                        //
                        ////                        guard let httpBody = try? JSONSerialization.data(withJSONObject: postString, options: []) else{return}
                        //
                        ////                        request.httpBody = httpBody
                        ////                        let session  = URLSession.shared
                        ////                        session.dataTask(with: request){ (data,response,error) in
                        ////                            if let response  = response {
                        ////                                print(response)
                        ////
                        ////                        }
                        ////                            if let data = data{
                        ////                                do{
                        ////                                    let json =  try JSONSerialization.jsonObject(with: data, options: [])
                        ////                                    print(json)
                        ////                                } catch{
                        ////                                    print(error)
                        ////                                }
                        ////                            }
                        ////
                        ////
                        ////                        }.resume()
                        //
                        
                        Alamofire.request(URL_USER_REGISTER,method: .post,parameters:parameters).validate().responseString{
                            response in
                            //print("Response String: \(response.result.value)")
                            
                            let convertReponse = response.result.value
                            
                            
                            if let data = convertReponse?.data(using: .utf8) {
                                do {
                                    print("RESPONSE    \(try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any])")
                                    //return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                            
                        }
                        
                            .responseJSON{
                                response in print(response)
                            print("Response JSON: \(response.result.value)")
                        
                                
                            
                            //Getting the JSON Value from the server
                            let defaultValues = UserDefaults.standard
                        
                            
//                            let array = response.result.value as!Array<NSDictionary>.ArrayLiteralElement
//                            print(array)
                        
//                            let jsonString = response.result.value!
//                            print("jsonString: \(jsonString)");
//
//
//                            print(getStatus);
//
///
//                            let jsonData =  jsonString.data(using: .utf8)
//                              print("jsonData: \(jsonData)");
//                            let dictionary = try? JSONSerialization.jsonObject(with: jsonData!, options: .mutableLeaves)
//                            print(dictionary);
//
                            
//                            var getStatus = convertResponse.value(forKey: "status") as! [Int]
//                           print("STATUS ::    \(getStatus[0])")
//                            print("STATUS  TRUE / False ::    \(getStatus == 200))")
//
//                            if(getStatus == [200]){
//                                print("successfully")
//                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                                let twop = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//                                let alertController = UIAlertController(title: "Thank you for registering an account with us.", message: "However, You have not been approved to drive with Gravo yet! We will get back to you shortly. Thank you for your patience!", preferredStyle: UIAlertControllerStyle.alert)
//                                let ok = UIAlertAction(title: "I understand", style: UIAlertActionStyle.default, handler: {(action) -> Void in
//                                    //self.show(twop, sender: self)
//
//                                    print("Test")
//                                })
//
//                                alertController.addAction(ok)
//
//                                self.present(alertController, animated: true, completion: nil)
//
//
//                                //                                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                                //                                let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//                                //                                self.show(vc, sender: self)
//
//                            } else{
//
//                                // Create the alert controller
//                                let alertController = UIAlertController(title: "Alert!!!", message: "The email you provided already has an existing account. Please try logging in", preferredStyle: .alert)
//
//                                // Create the actions
//                                let okAction = UIAlertAction(title: "Login Page", style: UIAlertActionStyle.default) {
//                                    UIAlertAction in
//                                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                                    let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//                                    self.show(vc, sender: self)
//                                }
//                                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
//                                    UIAlertAction in
//                                    NSLog("Cancel Pressed")
//                                }
//
//                                // Add the actions
//                                alertController.addAction(okAction)
//                                alertController.addAction(cancelAction)
//
//                                // Present the controller
//                                self.present(alertController, animated: true, completion: nil)
//
//                            }
//
                            
                        }
                        
                    }
                        //validation first name and last name
                    else{
                        let alert = UIAlertController(title: "Alert!!!", message: "Invalid Name", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Re-enter Name", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                }
                    //validation email
                else{
                    let alert = UIAlertController(title: "Alert!!!", message: "Invalid Email", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Re-Enter", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
                
                //for checking empty string
            }else{
                let alert = UIAlertController(title: "Alert!!!", message: "You need to fill up", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Re-enter", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                
            }
            
        }
            
            //for checking checkbox selected
        else{
            let alert = UIAlertController(title: "Alert!!!", message: "Please Accept Term and Conditions", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
        
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
        txtAddress.text! = place.formattedAddress!
        
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

