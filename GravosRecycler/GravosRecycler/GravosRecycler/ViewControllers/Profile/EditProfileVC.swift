//
//  EditProfileVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 19/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import Alamofire
import GooglePlaces



class EditProfileVC: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
	
	let URL_UPLOAD_IMAGE = "http://ehostingcentre.com/gravo/updateimage.php"
	let URL_UPDATE_USER_DETAILS = "http://ehostingcentre.com/gravo/updateuserdetails.php"
	
	let userdefault = UserDefaults.standard
	var localPath : String?
	
	@IBOutlet weak var txtFirstName: UITextField!
	@IBOutlet weak var txtLastName: UITextField!
	@IBOutlet weak var txtEmail: UITextField!
	
	@IBOutlet weak var imgProfile: UIImageView!
	@IBOutlet weak var txtAddress: UITextField!
	@IBOutlet weak var txtFloor: UITextField!
	
	@IBOutlet weak var txtUnit: UITextField!
	
	@IBOutlet weak var txtPhone: UITextField!
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		txtAddress.delegate = self
		txtFirstName.delegate = self
		txtLastName.delegate = self
		txtEmail.delegate = self
		txtFloor.delegate = self
		txtUnit.delegate = self
		txtPhone.delegate = self
		
		getAlldetails()
		
		let taphidekeyboard: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EditProfileVC.dismissKeyboard))
		taphidekeyboard.cancelsTouchesInView = false
		view.addGestureRecognizer(taphidekeyboard)
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchTapped(_:)))
		self.txtAddress.addGestureRecognizer(tap)
		
		// Do any additional setup after loading the view.
	}
	
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
	
	@IBAction func btnUploadImage(_ sender: Any) {
		let imagePickerController  = UIImagePickerController()
		
		imagePickerController .delegate  = self
		
		let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
		
		actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction)in
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
		
		actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel,handler: nil))
		
		self.present(actionSheet,animated: true,completion: nil)
		
		
		
		
	}
	
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		
//		var getpickerimage: UIImage
		
		
		if let pickerImage = info[UIImagePickerControllerOriginalImage] as?
			
			UIImage {
			imgProfile.contentMode = .scaleAspectFit
			imgProfile.image = pickerImage
		}
		
		
		guard let image = info[UIImagePickerControllerOriginalImage]as? UIImage else{
			return
		}
		
		print("pickerImage : \(image)")
		
		let imageData = UIImageJPEGRepresentation(image, 80)
		
		// We use document directory to place our cloned image
		let documentDirectory: NSString =  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as NSString
		// Set static name, so everytime image is cloned, it will be named "temp", thus rewrite the last "temp" image.
		// *Don't worry it won't be shown in Photos app.
		let imageName = "temp"
		let imagePath = documentDirectory.appendingPathComponent(imageName)
		
		// Encode this image into JPEG. *You can add conditional based on filetype, to encode into JPEG or PNG
		if let data = UIImageJPEGRepresentation(image, 80) {
			// Save cloned image into document directory]
			do{
				try data.write(to: URL(fileURLWithPath: imagePath), options: .atomic)
			} catch {
				print(error)
			}
			
			//data.writeToFile(imagePath, atomically: true)
		}
		
		// Save it's path
		localPath = imagePath
		print("PRINT THE LOCAL PATH : \(localPath)")
		
		
		
		let headers = [
			"Content-Type": "application/x-www-form-urlencoded",
			"cache-control": "no-cache",
			"Postman-Token": "96683f27-9437-4895-815a-39dd40dc6010"
		]
		
		let postData = NSMutableData(data: "userid=\(UserDefaults.standard.value(forKey: "id"))".data(using: String.Encoding.utf8)!)
		postData.append("&image_name=fasdfsf".data(using: String.Encoding.utf8)!)
		postData.append("&encoded_string=faefqre".data(using: String.Encoding.utf8)!)
		
		let request = NSMutableURLRequest(url: NSURL(string: "http://ehostingcentre.com/gravo/updateimage.php?userid=\(UserDefaults.standard.value(forKey: "id")!)&image_name=asset.JPG?id=9F983DBA-EC35-42B8-8773-B597CF782EDD&ext=JPG&encoded_string=fwefwwef")! as URL,
										  cachePolicy: .useProtocolCachePolicy,
										  timeoutInterval: 10.0)
		request.httpMethod = "POST"
		request.allHTTPHeaderFields = headers
		request.httpBody = postData as Data
		
		let session = URLSession.shared
		let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
			if (error != nil) {
				print(error)
			} else {
				let httpResponse = response as? HTTPURLResponse
				print(httpResponse)
			}
		})
		
		dataTask.resume()
		
		
		
		
		
		
		
		
		
		
		
		
		
//		let parameters = [
//			"userid": "\(UserDefaults.standard.value(forKey: "id"))",
//			"": "xxxxx",
//			"models": "nudity,wad"
//		]
//		Alamofire.upload( multipartFormData : {(MultipartFormData) in
////			let filePath = NSURL(fileURLWithPath: path)
//			MultipartFormData.append(imageData!, withName: "media", fileName: "upload", mimeType: "png")}, to: "http://ehostingcentre.com/gravo/updateimage.php")
//
//		{ (result) in
//			switch result {
//			case .success(let upload, _, _):
//
//				upload.uploadProgress(closure: { (Progress) in
//					print("Upload Progress: \(Progress.fractionCompleted)")
//				})
//
//				upload.responseJSON { response in
//					//self.delegate?.showSuccessAlert()
//					print(response.request)  // original URL request
//					print(response.response) // URL response
//					print(response.data)     // server data
//					print(response.result)   // result of response serialization
//					//                        self.showSuccesAlert()
//					//self.removeImage("frame", fileExtension: "txt")
//					if let JSON = response.result.value {
//						print("JSON: \(JSON)")
//					}
//				}
//
//			case .failure(let encodingError):
//				//self.delegate?.showFailAlert()
//				print(encodingError)
//			}
//
//		}
//
//		Alamofire.upload(.POST, "http://ehostingcentre.com/gravo/updateimage.php"
//			, multipartFormData: { formData in
//				// get file path URL
//				let filePath = NSURL(fileURLWithPath: path)
//				// add file as Request Body with fieldname "upload"
//				formData.appendBodyPart(fileURL: filePath, name: "upload")
//				// add a string with fieldname "test" and value "Alamofire"
//				formData.appendBodyPart(data: "Alamofire".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, name: "test")
//		}, encodingCompletion: { encodingResult in
//			switch encodingResult {
//			case .Success:
//				print("SUCCESS")
//			case .Failure(let error):
//				print(error)
//			}
//		})
		
		
		dismiss(animated: true, completion: nil)
	}
	
	
	
	
	//        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
	//			if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
	//				imgProfile.contentMode = .scaleAspectFit
	//				imgProfile.image = pickedImage
	//			}
	//
	//
	////            // We use document directory to place our cloned image
	////			let documentDirectory: NSString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as NSString
	////
	////            // Set static name, so everytime image is cloned, it will be named "temp", thus rewrite the last "temp" image.
	////            // *Don't worry it won't be shown in Photos app.
	////            let imageName = "temp"
	////            let imagePath = documentDirectory.appendingPathComponent(imageName)
	////
	////            '''// Encode this image into JPEG. *You can add conditional based on filetype, to encode into JPEG or PNG
	////            if let data = UIImageJPEGRepresentation(image, 80) {
	////                // Save cloned image into document directory]
	////				do{
	////					try data.write(to: URL(fileURLWithPath: imagePath), options: .atomic)
	////				} catch {
	////					print(error)
	////				}
	////
	////                //data.writeToFile(imagePath, atomically: true)
	////            }
	////
	////            // Save it's path
	////            localPath = imagePath
	////			print(localPath)'''
	//
	//
	//
	//
	//           picker.dismiss(animated: true, completion: nil)
	
	
	
	
	
	@objc func touchTapped(_ sender: UITapGestureRecognizer){
		print("address text field enter")
		
		let touchTapped = GMSAutocompleteViewController()
		touchTapped.delegate = self
		UINavigationBar.appearance().barTintColor = UIColor.darkGray
		UINavigationBar.appearance().tintColor = UIColor.white
		
		let filter = GMSAutocompleteFilter()
		txtAddress.text! = ""
		filter.type = .noFilter
		//filter.type = .establishment
		filter.country = "SG"
		touchTapped.autocompleteFilter = filter
		present(touchTapped, animated: true, completion: nil)
		
	}
	
	override func viewWillAppear(_ animated: Bool)
	{
		
		imgProfile.layer.borderWidth = 0.1
		imgProfile.layer.masksToBounds = false
		imgProfile.layer.borderColor = UIColor.black.cgColor
		imgProfile.layer.cornerRadius = imgProfile.frame.height/2
		imgProfile.clipsToBounds = true
		
		let sideMenu  = UIBarButtonItem(image: UIImage(named:"BackArrow"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.toggleSideMenu(_:)))
		sideMenu.tintColor = UIColor.black
		self.navigationItem.leftBarButtonItem = sideMenu
		
		//getAlldetails()
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	@objc func toggleSideMenu(_ sender: Any)
	{
		self.navigationController?.popViewController(animated: true)
	}
	
	
	func getAlldetails(){
		let getFirstName  =  userdefault.value(forKey: "passfirstname")! as! String
		let getLastName = userdefault.value(forKey: "passlastname")! as! String
		let getAddress = userdefault.value(forKey: "passaddress")! as! String
		let getEmail = userdefault.value(forKey: "email")! as! String
		let getUnit = userdefault.value(forKey: "unit")! as! String
		
		var getUnitArr = getUnit.components(separatedBy: "-")
		
		let getFloor = getUnitArr[0]
		let getUnitNum = getUnitArr[1]
		
		let getphoneNum = userdefault.value(forKey: "contact_number")! as! String
		
		
		let urlImage = NSURL(string : UserDefaults.standard.value(forKey: "photo")! as! String)
		print(urlImage as Any)
		
		
		let data = NSData(contentsOf: urlImage! as URL)
		
		if data != nil{
			
			imgProfile.image = UIImage(data: data! as Data)
		}
		
		txtFirstName.text! = getFirstName
		txtLastName.text! = getLastName
		txtEmail.text! = getEmail
		txtAddress.text! = getAddress
		txtFloor.text! = getFloor
		txtUnit.text! = getUnitNum
		txtPhone.text! = getphoneNum
		
		
	}
	
	
	@IBAction func btnCancel(_ sender: Any) {
		self.navigationController?.popViewController(animated: true)
	}
	
	
	@IBAction func btnSave(_ sender: Any) {
		let getuserId = userdefault.value(forKey: "id")!
		let getEmail = userdefault.value(forKey: "email")!
		
		print(txtFirstName.text!)
		if(txtFirstName.text! != "" && txtLastName.text! != "" && txtAddress.text! != "" && txtFloor.text! != "" && txtUnit.text! != "" && txtPhone.text! != ""){
			
			if(isValidName(txtFirstName.text!) && isValidName(txtLastName.text!)){
				
				
				let parameters: Parameters = [
					"userid" : "\(getuserId)",
					"email" : "\(getEmail)",
					"firstname" : txtFirstName.text!,
					"lastname": txtLastName.text!,
					"unit":"\(txtFloor.text!)-\(txtUnit.text!)",
					"address": txtAddress.text!,
					"contactnumber": txtPhone.text!,
					]
				
				//                let firstName = txtFirstName.text!
				//                let lastName =  txtLastName.text!
				
				//                userdefault.set(firstName,forKey: "firstname")
				//                  userdefault.set(lastName,forKey: "lastname")
				//                userdefault.synchronize()
				//                print("\(firstName) \(lastName)")
				Alamofire.request(URL_UPDATE_USER_DETAILS,method: .post,parameters:parameters).responseJSON{
					response in
					
					print(response)
					
					self.navigationController?.popViewController(animated: true)
				}
			} else{
				
				let alert = UIAlertController(title: "Alert!!!", message: "Invalid Name", preferredStyle: UIAlertControllerStyle.alert)
				alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
				self.present(alert, animated: true, completion: nil)
			}
			
			
		} else{
			
			let alert = UIAlertController(title: "Alert!!!", message: "Please fill up all information ", preferredStyle: UIAlertControllerStyle.alert)
			alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
			self.present(alert, animated: true, completion: nil)
		}
		
		
	}
	
	func isValidName(_ nameString: String) -> Bool {
		
		var returnValue = true
		let mobileRegEx =  "[A-Za-z]"  // {3} -> at least 3 alphabet are compulsory.
		
		do {
			let regex = try NSRegularExpression(pattern: mobileRegEx)
			let nsString = nameString as NSString
			let results = regex.matches(in: nameString, range: NSRange(location: 0, length: nsString.length))
			
			if results.count == 0
			{
				returnValue = false
			}
			
		} catch let error as NSError {
			print("invalid regex: \(error.localizedDescription)")
			returnValue = false
		}
		
		return  returnValue
	}
	
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool
	{
		
		switch textField
		{
		case txtFirstName:
			txtLastName.becomeFirstResponder()
			break
		case txtLastName:
			txtFloor.becomeFirstResponder()
			break
		case txtFloor:
			txtUnit.becomeFirstResponder()
			break
		case txtUnit:
			txtPhone.becomeFirstResponder()
			break
		default:
			txtPhone.resignFirstResponder()
		}
		return true
	}
	
	func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
	{
		//txtViewContent.setContentOffset(textField.bounds.origin, animated: true)
		return true
	}
	
	
	
	
	
}


extension EditProfileVC: GMSAutocompleteViewControllerDelegate{
	// Handle the user's selection.
	func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
		//txtAddress.text! = ""
		txtAddress.text! = place.formattedAddress!
		
		print("Place name: \(place.name)")
		print("Place address: \(String(describing: place.formattedAddress!))")
		print("Place attributions: \(place.attributions)")
		
		dismiss(animated: true, completion: nil)
		
	}
	
	
	
	func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
		// TODO: handle the error.
		print("Error: ", error.localizedDescription)
	}
	
	// User canceled the operation.
	func wasCancelled(_ viewController: GMSAutocompleteViewController) {
		dismiss(animated: true, completion: nil)
	}
	
	// Turn the network activity indicator on and off again.
	func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
		UIApplication.shared.isNetworkActivityIndicatorVisible = true
	}
	
	func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
		UIApplication.shared.isNetworkActivityIndicatorVisible = false
	}
	func convertStringToDictionary(text: String) -> [String:AnyObject]? {
		if let data = text.data(using: String.Encoding.utf8) {
			do {
				let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
				return json
			} catch {
				print("Something went wrong")
			}
		}
		return nil
	}
	
	
	
}
