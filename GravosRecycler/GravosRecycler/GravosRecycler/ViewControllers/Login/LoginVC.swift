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

    @IBOutlet weak var pgCtrlLogin: UIPageControl!
    @IBOutlet weak var scrollLoginBanner: UIScrollView!
    @IBOutlet weak var viewScrollContent: UIView!
    @IBOutlet weak var imgBackground: UIImageView!
    
    lazy var totalBannerPages = 3
	
    override func viewDidLoad()
    {
        super.viewDidLoad()
        scrollLoginBanner.delegate = self
		self.customiseInterface()
        // Do any additional setup after loading the view.
        
    }

    override func viewWillAppear(_ animated: Bool)
    {
         scrollLoginBanner.scrollsToTop = true
    }
    
    func customiseInterface()
    {
        self.setupBannerView()
        self.setupGIFBackground()
    }
    
    //Functipm to setup swipping bannerview
    
    func setupBannerView()
    {
        var contentWidth: CGFloat = 0.0
        
        for label in 0...totalBannerPages
        {
            let lblDesc = UILabel()
            
            if(label == 1){
                lblDesc.text = .loginBanner2
            } else if(label == 2){
                
                 lblDesc.text = .loginBanner3
                
			} else {
				 lblDesc.text = .loginBanner
			}
        
           
            lblDesc.textColor = UIColor.white
			lblDesc.font = UIFont(name: .quicksandBoldF, size: 15)
            lblDesc.numberOfLines = 0
            lblDesc.textAlignment = .center
            //--------------------------
            let xCordinate = viewScrollContent.frame.midX + viewScrollContent.frame.width * CGFloat(label)
            contentWidth += viewScrollContent.frame.width
            scrollLoginBanner.addSubview(lblDesc)
            lblDesc.frame = CGRect(x: xCordinate - 120, y: (viewScrollContent.frame.height/2) - 50, width: viewScrollContent.frame.width * 0.7, height: 120)
        }
        scrollLoginBanner.contentSize = CGSize(width: contentWidth, height: viewScrollContent.frame.height)
    }
    
    //function to setup GIF background
    
    func setupGIFBackground()
    {
        let imgLoginBg = UIImage(gifName: .loginGIF)
        self.imgBackground.setGifImage(imgLoginBg)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        pgCtrlLogin.currentPage = (Int(scrollLoginBanner.contentOffset.x/214))
    }
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
        if let createAccountVC = self.storyboard?.instantiateViewController(withIdentifier: .createAccVC)
        {
            self.present(createAccountVC, animated: true)
        }
    }
    
}
