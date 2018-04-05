//
//  AddItemVC.swift
//  GravosCollector
//
//  Created by Abhijit on 29/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import GMStepper

protocol AddItemDelegate
{
    func itemAdded(transactionItem: entTransactionItem)
}

class AddItemVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var lblCatagory: UILabel!
    @IBOutlet weak var btnAddCatagory: UIButton!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var stepperWeight: GMStepper!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var viwCatagorySelection: UIView!
    @IBOutlet weak var pickCatagory: UIPickerView!
    
     var delegate: AddItemDelegate?
    
    var arrCategories = [Category]()
    
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
        stepperWeight.addTarget(self, action: #selector(self.stepperValueChanged), for: .valueChanged)
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        self.navigationController?.navigationBar.barTintColor = Constants.themeGreen
        self.showAnimate()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func showAnimate()
    {
        self.view.transform =  CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.2, animations: {
            self.view.alpha = 1.0
            self.view.transform =  CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion:{(finished : Bool) in
            if(finished)
            {
                //self.view.removeFromSuperview()
            }
        })
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.2, animations: {
            self.view.alpha = 1.0
            self.view.transform =  CGAffineTransform(scaleX: 1.3, y: 1.3)
        }, completion:{(finished : Bool) in
            if(finished)
            {
                self.view.removeFromSuperview()
            }
        })
    }
    @IBAction func submitAddItem(_ sender: Any)
    {
        let objTran  = entTransactionItem()
        objTran.iItemID = 4
        objTran.strItemType = EWasteItem.Cardboard
        objTran.strItemWeight = String(self.stepperWeight.value)
        objTran.strPrice = lblPrice.text
        objTran.strRate = lblRate.text
        delegate?.itemAdded(transactionItem:objTran)
        self.removeAnimate()
    }
    
    @IBAction func showCatagory(_ sender: Any)
    {
        self.viwCatagorySelection.isHidden = false
    }
    @IBAction func selectCatagory(_ sender: Any)
    {
        let selectedCatagory = self.arrCategories[self.pickCatagory.selectedRow(inComponent: 0)]
        self.lblRate.text = selectedCatagory.rate
        self.lblCatagory.text = selectedCatagory.type
        self.viwCatagorySelection.isHidden = true
        
        //Reset Stepper
        self.stepperWeight.value = 0.0
        lblPrice.text = "-"
    }
    @IBAction func cancelSelection(_ sender: Any)
    {
        self.viwCatagorySelection.isHidden = true
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.arrCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString?
    {
        let attributedString = NSMutableAttributedString(string: self.arrCategories[row].type)
        
        let firstAttributes:[NSAttributedStringKey:Any] = [NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue): UIFont(name: "Quicksand-Bold", size: 8.0)!, NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.darkGray]
        
        attributedString.addAttributes(firstAttributes, range: NSRange(location: 0, length: attributedString.string.count - 1))
        
        return attributedString
    }
    
    @objc func stepperValueChanged(stepper: GMStepper)
    {
        print(stepper.value, terminator: "")
        
        if stepper.value == 0
        {
            lblPrice.text = "-"
        }
        else
        {
            if let strRate  = self.lblRate.text
            {
                let subSeq = strRate.dropLast(4)
                lblPrice.text  = "SGD " +  String(Double(String(describing: subSeq))! * stepper.value)
               
            }
        }
    }
    
    
}
