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
    static let kRemoteAddress = "http://greenravolution.com/API/"
    static let themeGreen = UIColor.init(red: 66.0/255.0, green: 187.0/255.0, blue: 142.0/255.0, alpha: 1)
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
    static let loginBanner  = "GRAVO is also a platform through which environmental information and educational material can be accessed with ease for all subscribers."
    static let loginGIF     = "recycle_cinemagraph_2.gif"
    
    //Login
    static let placeEmail   = "Enter Email"
    static let placePass    = "Enter Password"
    
    //Profile
    static let accountinfo  = "Account Information"
	static let others		= "Others"
    
}
