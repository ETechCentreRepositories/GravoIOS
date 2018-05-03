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
    
}

extension String
{
    //View Controllers StoryboardID
    static let createAccVC  = "CreateAccountVC"
    static let pagingVC     = "PagingVC"
    //Custom cells
    static let homecell     = "HomeCollCell"
    //FONT
    static let quicksandF   = "Quicksand-Bold"
    
    //Welcome
    static let loginBanner  = "GRAVO is also a platform through which environmental information and educational material can be accessed with ease for all subscribers."
    static let loginGIF     = "recycle_cinemagraph_2.gif"
    
    //Login
    static let placeEmail   = "Enter Email"
    static let placePass    = "Enter Password"
}
