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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        txtUsername.attributedPlaceholder = NSAttributedString(string: "Enter Email",
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        txtPassword.attributedPlaceholder = NSAttributedString(string: "Enter Password",
                                                               attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
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

    @IBAction func dismissViewController(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
}
