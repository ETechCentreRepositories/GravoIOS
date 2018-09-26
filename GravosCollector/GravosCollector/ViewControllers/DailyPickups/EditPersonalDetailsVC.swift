//
//  EditPersonalDetailsVC.swift
//  GravosCollector
//
//  Created by Ivan Lipotan on 18/9/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import GooglePlaces
import GooglePlacePicker
import Alamofire

class EditPersonalDetailsVC: UIViewController,UITextFieldDelegate{
    let URL_UPDATE_USER = "http://ehostingcenter.com/gravo/updateuserprofile.php"
    
    @IBOutlet weak var firstName: TextViewWithLeftImage!
    @IBOutlet weak var lastName: TextViewWithLeftImage!
    
    @IBOutlet weak var email: TextViewWithLeftImage!
    
    @IBOutlet weak var phone: TextViewWithLeftImage!
    @IBOutlet weak var address: TextViewWithLeftImage!
    
    @IBOutlet weak var vehiclenum: TextViewWithLeftImage!
    @IBOutlet weak var licensenum: TextViewWithLeftImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchTapped(_:)))
        self.address.addGestureRecognizer(tap)
        
        
        let defaultValues = UserDefaults.standard
        if let getfirstname  = defaultValues.string(forKey: "first_name"){
            firstName.text = getfirstname
        }
        if let getlastname = defaultValues.string(forKey: "last_name"){
             lastName.text = getlastname
        }
        if let getemail = defaultValues.string(forKey:"email"){
            email.text = getemail
            
        }
        
        if let getphone = defaultValues.string(forKey:"phone"){
            phone.text = getphone
        }
        if let getliscence = defaultValues.string(forKey:"liscence_number"){
            licensenum.text = getliscence
        }
        if let getvehicle = defaultValues.string(forKey:"vehicle_number"){
            vehiclenum.text = getvehicle
        }
        
        if let getaddress = defaultValues.string(forKey:"address"){
            address.text = getaddress
        }
        
    }
    
    @objc func touchTapped(_ sender: UITapGestureRecognizer){
        print("press address text field")
        
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
    @IBAction func btnSave(_ sender: UIButton) {
        print("CLICKED")
        print(self.firstName.text!)
        if(self.firstName.text! != "" && self.lastName.text! != "" && self.email.text! != "" && self.phone.text! != "" && self.licensenum.text! != "" && self.vehiclenum.text! != "" && self.address.text! != ""){
            if(self.isValidEmail(testStr: self.email.text!)){
                if(self.isValidName(self.firstName.text!) && self.isValidName(self.lastName.text!)){
                   
                    
                    let parameters  = [
                        
                        "email":email.text!,
                        "firstname": firstName.text!,
                        "lastname": lastName.text!,
                        "contactnumber": phone.text!,
                        "address": address.text!,
                     
                        "liscencenumber": licensenum.text!,
                        "vehiclenumber" : vehiclenum.text!,
                        
                        ]
                    
                    Alamofire.request(URL_UPDATE_USER,method:.post ,parameters:parameters).responseJSON{
                        response in print(response)
                        
                        if let result = response.result.value{
                            let jsonData = result as!NSDictionary
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                    
                }
                //name wrong
                else{
                    let alert = UIAlertController(title: "Alert !!!", message: "Invalid Name", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            //email wrong
            else{
                let alert = UIAlertController(title: "Alert !!!", message: "Invalid Email", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
         
            
            
            
        } else{
            
            let alert = UIAlertController(title: "Hi There!", message: "Need to fill up", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func dismissViewController(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
        
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

extension EditPersonalDetailsVC: GMSAutocompleteViewControllerDelegate{
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        address.text! = place.formattedAddress!
        
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
