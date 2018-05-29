//
//  DataHandler.swift
//  GravosCollector
//
//  Created by Abhijit on 29/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import Alamofire

class DataHandler: NSObject
{
    var parameters: Parameters = [:]
	
    func fetchRemoteData(inputAddress: String, completion: @escaping (_ result: Any) -> Void)
    {
        let dynamicAddress =  Constants.kRemoteAddress + inputAddress + ".php"
		
		
        Alamofire.request(
            URL(string: dynamicAddress)!,
            method: .get,
            parameters: parameters)
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else
                {
                    print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                    completion("Error while fetching remote!")
                    return
                }
                
                guard let value = response.result.value as? [String: Any],
                    let _ = value["result"] as? [[String: Any]] else
                {
                    print("Malformed data ")
                    completion("Malformed data")
                    print(response.description)
                    return
                }
                
            }
    }
    
	func postRemoteData(inputAddress: String, inputParameters : [String : String], completion: @escaping (_ result: Any) -> Void)
    {
        let dynamicAddress =  Constants.kRemoteAddress + inputAddress + ".php"
		
		parameters = inputParameters
		
        Alamofire.request(
            URL(string: dynamicAddress)!,
            method: .post,
            parameters: parameters)
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else
                {
                    print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                    completion("Error while fetching remote!")
                    return
                }
                
                guard let responsealue = response.result.value as? [String: Any],
					let _ = responsealue["result"] as? [[String: Any]] else
                {
					let result = self.parse(inputJSON: response.result.value as! [String : Any] , inputAdress: inputAddress)
                    completion(result)
                    return
                }
                
            }
    }
    
	func parse(inputJSON : [String:Any], inputAdress: String) -> Any
	{
			
			switch inputAdress
			{
			case APIaddress.login.rawValue:
				let result = self.parseLoginDetails(inputJSON: inputJSON)
				print(result)
				return result
			case APIaddress.signup.rawValue:
				let result = self.parseSignUpDetails(inputJSON: inputJSON)
				print(result)
				return result
			default:
				print("")
				return ""
			}
	}
	
	func parseSignUpDetails(inputJSON : [String:Any]) -> Bool
	{
		let status = inputJSON[UserResponseKeys.status.rawValue] as! Int
		let message = inputJSON[UserResponseKeys.message.rawValue] as! String
		print(message)
		switch status
		{
		case 200:
			
			return true
		case 404:
			return false
		default:
			break
		}
		return true
	}
	
	func parseLoginDetails(inputJSON : [String:Any]) -> LoggedInUsers
	{
		let status = inputJSON[UserResponseKeys.status.rawValue] as! Int
		let responseUser = LoggedInUsers()
		switch status
		{
		case 200:
			if inputJSON["users"] != nil
			{
				let users = inputJSON["users"] as? [[String : AnyObject]]
				
				let user1 = users![0]
				
				if let fName = user1["first_name"]
				{
					responseUser.firstname = fName as! String
				}
				if let lName = user1["last_name"]
				{
					responseUser.lastname = lName as! String
				}
				if let email = user1["email"]
				{
					responseUser.email = email as! String
				}
				if let number = user1["contact_number"]
				{
					responseUser.contact = number as! String
				}
				if let address = user1["address"]
				{
					responseUser.address = address as! String
				}
				
				//--Perform DB operation
				DBManager.shared.deleteallUserData()
				DBManager.shared.insertUserData(userDetails: responseUser)
			}
			break
		case 404:
			responseUser.errormessage = inputJSON["message"] as! String
			break
		default: break
			//do nothing
		}
		
		return responseUser
	}
	
	
}

class LoggedInUsers : NSObject
{
	var id : String = ""
	var firstname : String = ""
	var lastname : String = ""
	var email : String = ""
	var contact : String = ""
	var address : String = ""
	var errormessage : String = ""
}
//-------------------------------------------------------------------------------------------------
class ResponseCatagopry : Decodable
{
    var status : Int
    var message : String
    var result : [Category]
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: UserResponseKeys.self)
        self.status = (try container.decodeIfPresent(Int.self, forKey: .status))!
        self.message = (try container.decodeIfPresent(String.self, forKey: .message))!
        self.result = (try container.decodeIfPresent([Category].self, forKey: .result))!
    }
}

//-------------------------------------------------------------------------------------------------
class ResponseLogin : Decodable
{
	var status = Int()
	var message = String()
	var users : [Users]
	required init(from decoder: Decoder) throws {
		
		let container = try decoder.container(keyedBy: UserResponseKeys.self)
		self.status = (try container.decodeIfPresent(Int.self, forKey: .status))!
		self.message = (try container.decodeIfPresent(String.self, forKey: .message))!
		self.users = (try container.decodeIfPresent([Users].self, forKey: .result))!
		
	}
}

//-------------------------------------------------------------------------------------------------

class Users : Decodable
{
	var id : String
	var firstname : String
	var lastname : String
	var email : String
	var contact : String
	var address : String
	
	required init(from decoder: Decoder) throws {
		
		let container = try decoder.container(keyedBy: UserResponseKeys.self)
		do {
			
			self.id 		= " "
			self.firstname 	= " "
			self.lastname 	= " "
			self.email 		= " "
			self.contact 	= " "
			self.address 	= " "
			
			if let id = (try container.decodeIfPresent(String.self, forKey: .id))
			{
				self.id = id
			}
			if let firstname = (try container.decodeIfPresent(String.self, forKey: .firstname))
			{
				self.firstname = firstname
			}
			if let lastname = (try container.decodeIfPresent(String.self, forKey: .lastname))
			{
				self.lastname = lastname
			}
			if let email = (try container.decodeIfPresent(String.self, forKey: .email))
			{
				self.email = email
			}
			if let contact = (try container.decodeIfPresent(String.self, forKey: .contact))
			{
				self.contact = contact
			}
			if let address = (try container.decodeIfPresent(String.self, forKey: .address))
			{
				self.address = address
			}
			
		} catch let jsonerr
		{
			print(jsonerr)
			
			self.id 		= " "
			self.firstname 	= " "
			self.lastname 	= " "
			self.email 		= " "
			self.contact 	= " "
			self.address 	= " "
		}
		
	}
	
	func setInitValues()
	{
		self.id 		= " "
		self.firstname 	= " "
		self.lastname 	= " "
		self.email 		= " "
		self.contact 	= " "
		self.address 	= " "
	}
}
//-------------------------------------------------------------------------------------------------
class Category : Decodable
{
    var id : String
    var type : String
    var rate : String
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: UserResponseKeys.self)
        do {

			self.id 	= " "
			self.type 	= " "
			self.rate 	= " "
            if let id = (try container.decodeIfPresent(String.self, forKey: .id))
            {
                self.id = id
            }
            if let type = (try container.decodeIfPresent(String.self, forKey: .type))
            {
                self.type = type
            }
            if let rate =  (try container.decodeIfPresent(String.self, forKey: .rate))
            {
                self.rate = rate
            }
            
        } catch let jsonerr
        {
            print(jsonerr)
			self.id 	= " "
			self.type 	= " "
			self.rate 	= " "
        }
        
    }
	func setInitValues()
	{
		self.id 	= " "
		self.type 	= " "
		self.rate 	= " "
	}
}


//-------------------------------------------------------------------------------------------------
enum APIaddress: String
{
    case categories     = "getCategories"
    case login          = "login"
	case signup          = "signup"
}
//-------------------------------------------------------------------------------------------------
enum UserResponseKeys: String, CodingKey
{
    case status     = "status"
    case message    = "message"
    case result     = "result"
    case id         = "id"
	case rate       = "rate"
	case type       = "type"
    case firstname	= "first_name"
	case lastname	= "last_name"
	case email		= "email"
	case contact	= "contact_number"
	case address 	= "address"
	case password	= "password"
}
