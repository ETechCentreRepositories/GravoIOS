
//
//  LoginVC.swift
//  GravosCollector
//
//  Created by Abhijit on 15/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import SwiftyGif

class LoginVC: UIViewController,UIScrollViewDelegate {

  
    @IBOutlet weak var imgBackground: UIImageView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        scrollLoginBanner.delegate = self
        // Do any additional setup after loading the view.
        self.customiseInterface()
    }

    override func viewWillAppear(_ animated: Bool)
    {
//         scrollLoginBanner.reloadInputViews()
    }
    func customiseInterface()
    {
        var contentWidth: CGFloat = 0.0
        for label in 0...2
        {
            let lblDesc = UILabel()
            lblDesc.text = "GRAVO is also a platform through which environmental information and educational material can be accessed with ease for all subscribers."
            lblDesc.textColor = UIColor.white
            lblDesc.font = UIFont(name: "Quicksand-Bold", size: 15)
            lblDesc.numberOfLines = 0
            lblDesc.textAlignment = .center
            
            
//            let xCordinate = viewScrollContent.frame.midX + viewScrollContent.frame.width * CGFloat(label)
//            contentWidth += viewScrollContent.frame.width
//            scrollLoginBanner.addSubview(lblDesc)
//            lblDesc.frame = CGRect(x: xCordinate - 120, y: (viewScrollContent.frame.height/2) - 50, width: viewScrollContent.frame.width * 0.7, height: 120)
        }
//        scrollLoginBanner.contentSize = CGSize(width: contentWidth, height: viewScrollContent.frame.height)
       
        
        let imgLoginBg = UIImage(gifName: "recycle_cinemagraph_2.gif")
        self.imgBackground.setGifImage(imgLoginBg)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//    func scrollViewDidScroll(_ scrollView: UIScrollView)
//    {
//        pgCtrlLogin.currentPage = (Int(scrollLoginBanner.contentOffset.x/214))
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func performCreateAccount(_ sender: Any)
    {
        if let createAccountVC = self.storyboard?.instantiateViewController(withIdentifier: "CreateAccountVC")
        {
            self.present(createAccountVC, animated: true)
        }
    }
    
}
