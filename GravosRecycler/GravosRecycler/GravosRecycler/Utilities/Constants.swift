//
//  Constants.swift
//  GravosCollector
//
//  Created by Abhijit on 3/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import Foundation
import UIKit
struct Constants
{
    static let kRemoteAddress 	= "https://www.greenravolution.com/API/"
	static let kLogin			= "login"
	static let kSignup			= "signup"
	static let kCategory		= "getCategories"
	
    static let themeGreen  = UIColor.init(red: 66.0/255.0, green: 187.0/255.0, blue: 142.0/255.0, alpha: 1)
    static let themeYellow = UIColor.init(red: 255.0/255.0, green: 219.0/255.0, blue: 73.0/255.0, alpha: 1)
    static let themePurple = UIColor(red: 107/255, green: 69/255, blue: 163/255, alpha: 1)
	static let themeOrange = UIColor(red: 244/255, green: 96/255, blue: 46/255, alpha: 1)
}

extension String
{
    //General
    static let aboutusURL   = "https://greenravolution.com/"
    
    //View Controllers StoryboardID
    static let createAccVC  = "CreateAccountVC"
    static let pagingVC     = "PagingVC"
    static let editProfile  = "EditProfileVC"
    
    
    //Custom cells
    static let homecell     = "HomeCollCell"
    static let profilecell	= "ProfileCell"
    //FONT
    static let quicksandBoldF   = "Quicksand-Bold"
	static let quicksandReg		= "Quicksand"
    
    //Welcome
    static let loginBanner  = "Tip 1\n Different recycle bins have different uses! Do look before you throw!"
	
	 static let loginBanner2  = "Tip 2\n Always Reuse items whenever you can!"
	
	static let loginBanner3  = "Tip 3\n Try to bring a tupperware when you are buying food back"
    static let loginGIF     = "recycle_cinemagraph_2.gif"
    
    //Login
    static let placeEmail   = "Enter Email"
    static let placePass    = "Enter Password"
    
    //Profile
    static let accountinfo  = "Account Information"
	static let others		= "Others"
    
}
