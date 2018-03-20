//
//  TextViewWithLeftImage.swift
//  GravosCollector
//
//  Created by Abhijit on 15/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

@IBDesignable
class TextViewWithLeftImage: UITextField, UITextFieldDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var strIconImage: String?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        delegate = self
         addIconImage()
        if let strPlaceHolder = self.placeholder
        {
            self.attributedPlaceholder = NSAttributedString(string: strPlaceHolder,
                                                            attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        }
        
    }
    
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        
    }
    
    @IBInspectable var IconImage: String = "" {
        didSet {
            strIconImage = IconImage
            addIconImage()
        }
    }
    
    func createBorder()
    {
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor(red: 55/255, green: 78/255, blue: 95/255, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height-width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func addIconImage()
    {
        if let iconValue = strIconImage
        {
            let iconWidth = 30;
            let iconHeight = 30;
            
            let imageView = UIImageView();
            let imageEmail = UIImage(named: iconValue);
            imageView.image = imageEmail;
            
            // set frame on image before adding it to the uitextfield
            imageView.frame = CGRect(x: 5, y: 5, width: iconWidth, height: iconHeight)
            self.leftViewMode = UITextFieldViewMode.always
            self.addSubview(imageView)
            
            //set Padding
            let paddingView = UIView(frame: CGRect(x: 10, y: 0, width: 30.0, height: self.frame.height))
            self.leftView = paddingView
            
        }
        
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("focused")
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("lost focus")
    }
}
