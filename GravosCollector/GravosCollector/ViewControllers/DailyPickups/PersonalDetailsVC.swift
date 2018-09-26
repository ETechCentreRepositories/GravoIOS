//
//  PersonalDetailsVC.swift
//  GravosCollector
//
//  Created by Ivan Lipotan on 14/9/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
class PersonalDetailsVC: UIViewController{
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!

    @IBOutlet weak var licensenum: UILabel!
    @IBOutlet weak var vehiclenum: UILabel!
    
    @IBOutlet weak var address: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultValues = UserDefaults.standard
        if let getfirstname = defaultValues.string(forKey:"first_name"){
            firstname.text = getfirstname
            
        }
        if let getlastname = defaultValues.string(forKey:"last_name"){
            lastname.text = getlastname
            
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
    @IBAction func dismissViewController(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
        
    }
}
