//
//  BulkChildVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 20/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class BulkChildVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    @IBOutlet weak var imgView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(tapGestureRecognizer)
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        
        imagePicker.sourceType = .photoLibrary
       // imagePicker.sourceType = .camera
        
        
      
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
       print("SELECTED IMAGE VIEW")
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default
            , handler: {(action: UIAlertAction) in
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    imagePickerController.sourceType = .camera
                    self.present(imagePickerController,animated: true,completion: nil)
                } else{
                    print("Camera not available")
                }
                
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction)in
            imagePickerController.sourceType = .photoLibrary
            
            self.present(imagePickerController,animated: true,completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet,animated: true, completion: nil)
        
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

   
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
           imgView.image = image
            
            print("GET Image : \(image)")
        }
        
        picker.dismiss(animated: true, completion: nil )
    }
    
}
