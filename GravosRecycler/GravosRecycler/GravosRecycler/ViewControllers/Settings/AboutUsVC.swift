//
//  AboutUsVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 27/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import WebKit

class AboutUsVC: UIViewController,WKUIDelegate {

    @IBOutlet weak var wkviewAboutUs: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        wkviewAboutUs.uiDelegate = self
        
        let abouturl = URL(string: "https://www.apple.com")
        let aboutRequest = URLRequest(url: abouturl!)
        wkviewAboutUs.load(aboutRequest)
        
        //add observer to get estimated progress value
        self.wkviewAboutUs.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil);
        
        // Do any additional setup after loading the view.
        
        let sideMenu  = UIBarButtonItem(image: UIImage(named:"BackArrow"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.toggleSideMenu(_:)))
        sideMenu.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = sideMenu
    }

    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            print(self.wkviewAboutUs.estimatedProgress);
           // self.progressView.progress = Float(self.webView.estimatedProgress);
        }
    }
    
    @objc func toggleSideMenu(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
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

}
