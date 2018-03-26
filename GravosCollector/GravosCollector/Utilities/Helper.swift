//
//  Helper.swift
//  GravosCollector
//
//  Created by Abhijit on 20/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import SwiftyGif
class Helper: NSObject
{

    static func showLoader(onView : UIView)
    {
        let loaderView = UIView(frame: CGRect(x: onView.center.x-50, y: onView.center.y-50, width: 100, height: 100))
        loaderView.backgroundColor = UIColor.white
        let gif = UIImage(gifName: "Loader.gif")
        let imageview = UIImageView(gifImage: gif, loopCount: -1) // Use -1 for infinite loop
        imageview.frame = loaderView.bounds
        loaderView.addSubview(imageview)
        loaderView.tag = 99
        onView.addSubview(loaderView)
    }
    
    static func hideLoader(fromView : UIView)
    {
        let loaderView : UIView = fromView.viewWithTag(99)!
        loaderView.removeFromSuperview()
    }
}
