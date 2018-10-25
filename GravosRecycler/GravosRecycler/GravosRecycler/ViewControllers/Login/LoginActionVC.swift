//
//  LoginActionVC.swift
//  GravosCollector
//
//  Created by Abhijit on 15/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import FBSDKCoreKit
import FBSDKLoginKit
class LoginActionVC: UIViewController {
    
    let URL_USER_LOGIN = "http://ehostingcentre.com/gravo/login.php"
    let URL_GET_Categories = "http://ehostingcentre.com/gravo/getCategories.php?type=all"
	
    
    let URL_FORGET_PASSWORD = "http://ehostingcentre.com/gravo/forgetpassword.php"
	//let URL_GET_ACHIEVEMENT = "http://ehostingcentre.com/gravo/getachievements.php?id=\(UserDefaults.standard.value(forKey: "id")!)"
    
    @IBOutlet weak var txtUsername: TextViewWithLeftImage!
    @IBOutlet weak var txtPassword: TextViewWithLeftImage!
    
   
    @IBOutlet weak var btnFB: UIButton!
    
    @IBOutlet weak var txtForgetPassword: UIButton!
    
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnFB.addTarget(self, action:  #selector(facebookLogin), for: .touchUpInside)
        
       
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginActionVC.forgetPassword))
        
        txtForgetPassword.isUserInteractionEnabled = true
        txtForgetPassword.addGestureRecognizer(tap)
    }
    
    
    
    @objc func facebookLogin(){
        FBSDKLoginManager().logIn(withReadPermissions: ["email","public_profile"], from: self)
        { (Result, error) in
            if error != nil{
                print("Login Failed")
                return
            }
            self.showDetails()
        }
    }
    func showDetails(){
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields" : "name,  email, id" ]).start{
            (connection, result , error ) in
            if error != nil{
                print("Failed get Details")
                return
            }
            //print(result)
            let results : [String: String] = result as! [String: String]
            let email = results["email"]!
            let name = results["name"]!
            let id = results["id"]!
            
            let parameters: Parameters = [
            
            "facebook_id" : id,
            "fullname": name,
            "email": email,
            
            ]
			print("parameters \(parameters)")
            
            
            Alamofire.request("http://ehostingcentre.com/gravo/facebookloginsignup.php",method: .post,parameters: parameters).responseJSON{
                response in
				
				print("FB RESPONSE : \(response)")
                if response.result.isSuccess{
					
	
                    
                    let defaultValues = UserDefaults.standard
                    let convertResponse = response.result.value as!NSDictionary
                
                        let user  = convertResponse.value(forKey: "result")! as! NSArray
                        let id = user.value(forKey: "id")as![String]
                        let email = user.value(forKey: "email")as! [String]
                        let first_name = user.value(forKey: "first_name")as! [String]
                        let last_name = user.value(forKey: "last_name")as! [String]
                        let contact_number = user.value(forKey: "contact_number")as! [String]
                        let full_name  = user.value(forKey: "full_name")as![String]
                        let address = user.value(forKey: "address")as! [String]
                        let rank_name = user.value(forKey: "rank_name")as! [String]
                        let total_points = user.value(forKey: "total_points")as! [String]
                        let unit = user.value(forKey: "unit")as! [String]
                        let photo = user.value(forKey: "photo")as! [String]
                        defaultValues.set(id[0], forKey: "id")
                        defaultValues.set(email[0], forKey: "email")
                        defaultValues.set(first_name[0], forKey: "first_name")
                        defaultValues.set(last_name[0], forKey: "last_name")
                        defaultValues.set(full_name[0], forKey: "full_name")
                        defaultValues.set(contact_number[0], forKey: "contact_number")
                        defaultValues.set(address[0], forKey: "address")
                        defaultValues.set(rank_name[0],forKey: "rank_name")
                        defaultValues.set(total_points[0],forKey:"total_points")
                        defaultValues.set(unit[0],forKey: "unit")
                        defaultValues.set(photo[0],forKey: "photo")
					
					
					Alamofire.request(self.URL_GET_Categories, method: .get
						, parameters: nil).responseJSON{
							response in
							print("GET Categories : \(response)")
							
							let getresultresponse = response.result.value as! NSDictionary
							let getresult = getresultresponse.value(forKey: "result") as! NSArray
							
							
							defaultValues.set(getresult, forKey: "getresult")
							
					}
		
					
					Alamofire.request("http://ehostingcentre.com/gravo/getachievements.php?id=\(id[0])", method: .get
						, parameters: nil).responseJSON{
							response in
						print("GET THE RESPONSE  for LeaderBoard: \(response)")
							
							let getResultLeaderboard = response.result.value as! NSDictionary
							let getresult = getResultLeaderboard.value(forKey: "result")! as! NSArray
							defaultValues.set(getresult,forKey: "getResultLeaderboard")
							
					}
					
                   
                    
                    defaultValues.synchronize()
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                } else {
                    
                    let alert = UIAlertController(title: "Alert!!!", message: "Unable to Sign In", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
            
            
            
        }
            
    }
    
    
    
    @objc func forgetPassword (sender: UITapGestureRecognizer){
        if(txtUsername.text! == ""){
            let alert = UIAlertController(title: "Alert!!!", message: "Please Enter Your Email", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
           
            
        }else{
            
            if(isValidEmail(testStr: txtUsername.text!)){
                
                let parameters : Parameters = [
                    "email" : txtUsername.text!,
                    "role" : "recycler",
                    ]
                
                Alamofire.request(self.URL_FORGET_PASSWORD, method: .post
                    , parameters: parameters).responseJSON{
                        response in
                        if response.result.isSuccess{
                            let alert = UIAlertController(title: "Alert!!!", message: "Please Check Your Email", preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
                            
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                
                
            } else {
                let alert = UIAlertController(title: "Alert!!!", message: "Invalid Email", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
            }
            
    }
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
    
    
    
    
    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    
    
    
    
    @IBAction func btnFb(_ sender: FBSDKLoginButton) {
        
        
    }
    
    
    @IBAction func performLogin(_ sender: Any)
    {
        
        
        if(self.txtUsername.text! != "" && self.txtPassword.text! != ""){
            let parameters : Parameters = [
                "email" : txtUsername.text!,
                "password": txtPassword.text!,
                
                ]
            Alamofire.request(URL_USER_LOGIN,method:.post,parameters:parameters).responseJSON{
                response in
               //print(response)
                
                
                if response.result.isSuccess{
                    let defaultValues = UserDefaults.standard
                    let convertResponse = response.result.value as!NSDictionary
                    let getStatus = convertResponse.value(forKey:"status")! as!Int
                    if(getStatus == 200){
                        //print("Status 200")
					
                        let user  = convertResponse.value(forKey: "users")! as! NSArray
						let id = user.value(forKey: "id")as![String]
                        let email = user.value(forKey: "email")as! [String]
                        let first_name = user.value(forKey: "first_name")as! [String]
                        let last_name = user.value(forKey: "last_name")as! [String]
                        let contact_number = user.value(forKey: "contact_number")as! [String]
						let full_name  = user.value(forKey: "full_name")as![String]
                        let address = user.value(forKey: "address")as! [String]
						let rank_name = user.value(forKey: "rank_name")as! [String]
						let total_points = user.value(forKey: "total_points")as! [String]
						let unit = user.value(forKey: "unit")as! [String]
                        let photo = user.value(forKey: "photo")as! [String]
						defaultValues.set(id[0], forKey: "id")
                        defaultValues.set(email[0], forKey: "email")
                        defaultValues.set(first_name[0], forKey: "first_name")
                        defaultValues.set(last_name[0], forKey: "last_name")
                        defaultValues.set(full_name[0], forKey: "full_name")
                        defaultValues.set(contact_number[0], forKey: "contact_number")
                        defaultValues.set(address[0], forKey: "address")
						defaultValues.set(rank_name[0],forKey: "rank_name")
						defaultValues.set(total_points[0],forKey:"total_points")
						defaultValues.set(unit[0],forKey: "unit")
                        defaultValues.set(photo[0],forKey: "photo")
                        
                        //getCategories
                        
                        Alamofire.request(self.URL_GET_Categories, method: .get
                            , parameters: nil).responseJSON{
                                response in
							print("GET Categories : \(response)")
								
                                let getresultresponse = response.result.value as! NSDictionary
								 let getresult = getresultresponse.value(forKey: "result") as! NSArray
						
							
								defaultValues.set(getresult, forKey: "getresult")
                                
                        }
					
						Alamofire.request("http://ehostingcentre.com/gravo/getachievements.php?id=\(id[0])", method: .get
							, parameters: nil).responseJSON{
								response in
//								print("GET THE RESPONSE  for LeaderBoard: \(response)")
								
								let getResultLeaderboard = response.result.value as! NSDictionary
								let getresult = getResultLeaderboard.value(forKey: "result")! as! NSArray
								defaultValues.set(getresult,forKey: "getResultLeaderboard")
						
						}
						
						
						
                        defaultValues.synchronize()
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                        self.navigationController?.pushViewController(vc, animated: true)
                        

                    
                    
                    } else if(getStatus == 405){
                        let alert = UIAlertController(title: "Alert!!!", message: "Wrong Email and Password", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
                        
                        self.present(alert, animated: true, completion: nil)
                        print("Wrong  and Password ")
                    } else{
                        print("No such user")
                        let alert = UIAlertController(title: "Alert!!!", message: "User haven't Register", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
                        
                        self.present(alert, animated: true, completion: nil)
                        
                    }
                
                
            } else {
                print("error")
            }
            
        }
        
    } else{
    let alert = UIAlertController(title: "Alert!!!", message: "Please Insert your Email and Password", preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
    
    self.present(alert, animated: true, completion: nil)
    
    }
    
    
    
    
    
    
    
    //        let objDataHandler = DataHandler()
    //
    //        if let emailvalue = self.txtUsername.text
    //        {
    //            if let passwordValue = self.txtPassword.text
    //            {
    //                objDataHandler.postRemoteData(inputAddress: Constants.kLogin, inputParameters: ["email":emailvalue,"password":passwordValue], completion:
    //                    {result  in
    //                        if let response = result as? LoggedInUsers
    //                        {
    //                            if response.errormessage == ""
    //                            {
    //                                print(response.firstname)
    //                                //do db operation
    //
    //                                if let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "MyNavigationController")
    //                                {
    //                                    self.present(homeVC, animated: true)
    //                                }
    //                            }
    //                            else
    //                            {
    //                                //show error message
    //                            }
    //                        }
    //
    //
    //                })
    
    
    
    
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
