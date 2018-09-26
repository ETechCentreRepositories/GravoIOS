//
//  LoginActionVC.swift
//  GravosCollector
//
//  Created by Abhijit on 15/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import SwiftyGif
import Alamofire
class LoginActionVC: UIViewController {
    
    @IBOutlet weak var txtEmail: TextViewWithLeftImage!
    @IBOutlet weak var txtPassword: TextViewWithLeftImage!
    @IBOutlet weak var imgTest: UIImageView!
    
    let URL_USER_LOGIN = "http://ehostingcentre.com/gravo/collectorlogin.php"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        txtEmail.attributedPlaceholder = NSAttributedString(string: "Email",
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtPassword.attributedPlaceholder = NSAttributedString(string: "Password",
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
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
    
    @IBAction func performLogin(_ sender: Any)
    {
        if(self.txtEmail.text! != "" && self.txtPassword.text! != ""){
            let parameters : Parameters = [
                "email" :txtEmail.text!,
                "password": txtPassword.text!,
                ]
            
            Alamofire.request(URL_USER_LOGIN,method:.post,parameters:parameters).responseJSON{
                response in
                print(response)
                
                if response.result.isSuccess{
                    print("Success")
                    
                    let defaultValues = UserDefaults.standard
                    let convertResponse = response.result.value as!NSDictionary
                    let getStatus = convertResponse.value(forKey:"status")! as!Int
                    
                    if(getStatus == 200){
                        print("Status 200")
                        let user  = convertResponse.value(forKey: "users")! as! NSArray
                        
                        let email = user.value(forKey: "email")as! [String]
                        let first_name = user.value(forKey: "first_name")as! [String]
                        let last_name = user.value(forKey: "last_name")as! [String]
                        let phone = user.value(forKey: "phone")as! [String]
                        
                        let address = user.value(forKey: "address")as! [String]
                        
                        let liscence_number = user.value(forKey: "liscence_number")as! [String]
                        let vehicle_number = user.value(forKey: "vehicle_number")as! [String]
                        
                        defaultValues.set(email[0], forKey: "email")
                        defaultValues.set(first_name[0], forKey: "first_name")
                        defaultValues.set(last_name[0], forKey: "last_name")
                        
                        defaultValues.set(phone[0], forKey: "phone")
                        defaultValues.set(address[0], forKey: "address")
                        defaultValues.set(liscence_number[0], forKey: "liscence_number")
                        defaultValues.set(vehicle_number[0], forKey: "vehicle_number")
                       
//                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                        let vc = storyboard.instantiateViewController(withIdentifier: "PickupsVC") as! PickupsVC
//                        vc.navigationController?.navigationBar.barTintColor = self.hexStringToUIColor(hex: "#42BB8E")
//                        self.show(vc, sender: self)
                        
                        
                        
//                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                        let vc = storyboard.instantiateViewController(withIdentifier: "PickupsVC") as! PickupsVC
//                        self.navigationController?.pushViewController(vc, animated: true)

                        // Safe Push VC
                        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PickupsVC") as? PickupsVC{
                            if let navigator = self.navigationController {
                                navigator.pushViewController(viewController, animated: true)
                                navigator.navigationBar.barTintColor = self.hexStringToUIColor(hex: "#42BB8E")
                            }
                        }
                        
                    } else if(getStatus == 403){
                        let alert = UIAlertController(title: "Alert!!!", message: "Wrong Username and Password", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
                        
                        self.present(alert, animated: true, completion: nil)
                        print("Wrong Username and Password ")
                        
                        
                    } else{
                        print("No such user")
                        let alert = UIAlertController(title: "Alert!!!", message: "User haven't Register", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
                        
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                    
                    
                } else{
                    print("error")
                }
                
            }
            
        }
            // remind empty input
        else {
            let alert = UIAlertController(title: "Alert!!!", message: "Please Insert your Email and Password", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
        
        
        //Helper.showLoader(onView: self.view)
        // Helper.hideLoader(fromView: self.view)
    }
    
    @IBAction func dismissViewController(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
        
    }
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
