//
//  DataHandler.swift
//  GravosCollector
//
//  Created by Abhijit on 29/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class DataHandler: NSObject
{
    //let parameters: Parameters = [:]
    
    func fetchRemoteData(inputAddress: String, completion: @escaping (_ result: Any) -> Void)
    {
        /*let dynamicAddress =  Constants.kRemoteAddress + inputAddress + ".php"
        
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
            .responseData { response in
                debugPrint("All Response Info: \(response)")
                
                let result = self.doCodable(inputData: response.data!, inputAdress: inputAddress)
                completion(result)
                
        }*/
    }
    
    func postRemoteData(inputAddress: String, completion: @escaping (_ result: Any) -> Void)
    {
       /* let dynamicAddress =  Constants.kRemoteAddress + inputAddress + ".php"
        
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
                
                guard let value = response.result.value as? [String: Any],
                    let _ = value["result"] as? [[String: Any]] else
                {
                    print("Malformed data ")
                    completion("Malformed data")
                    print(response.description)
                    return
                }
                
            }
            .responseData { response in
                debugPrint("All Response Info: \(response)")
                
                let result = self.doCodable(inputData: response.data!, inputAdress: inputAddress)
                completion(result)
                
        }*/
    }
    
    
    func doCodable(inputData : Data, inputAdress: String) -> Any
    {
        do {
            
            switch inputAdress
            {
                
            case APIaddress.categories.rawValue:
                let decodedData =  try JSONDecoder().decode(ResponseCatagopry.self, from: inputData)
                let result = decodedData.result
                return result
            default:
                print("")
                return ""
            }
            
        } catch let jsonerr
        {
            print(jsonerr)
            return ""
        }
    }
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
class Category : Decodable
{
    var id : String
    var type : String
    var rate : String
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: UserResponseKeys.self)
        do {
            
            self.id = " "
            self.type = " "
            self.rate = " "
            
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
            
            self.id = " "
            self.type = " "
            self.rate = " "
        }
        
    }
}

//-------------------------------------------------------------------------------------------------
enum APIaddress: String
{
    case categories     = "getCategories"
    case login          = "login"
}
//-------------------------------------------------------------------------------------------------
enum UserResponseKeys: String, CodingKey
{
    case status     = "status"
    case message    = "message"
    case result     = "result"
    case id         = "id"
    case type       = "type"
    case rate       = "rate"
}
