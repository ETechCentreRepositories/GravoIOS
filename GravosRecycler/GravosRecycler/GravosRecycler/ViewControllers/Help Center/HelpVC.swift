//
//  HelpVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 13/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class HelpVC: UIViewController,UITextViewDelegate
{

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtViwMessage: UITextView!
    @IBOutlet weak var scrollHelp: UIScrollView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool)
    {
        self.txtViwMessage.text = "Message"
        self.title = "Help"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool
    {
        if (textView.text == "Message")
        {
            textView.text = ""
        }
        return true
    }
    
    @IBAction func submitHelp(_ sender: Any)
    {
        //--------
    }
    
}
