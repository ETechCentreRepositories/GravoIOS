//
//  entTransactionItem.swift
//  GravosCollector
//
//  Created by Abhijit on 29/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class entTransactionItem: NSObject
{
    var iItemID : Int?
    var strItemType : EWasteItem?
    var strItemWeight : String?
    var strPrice : String?
    var strRate : String?
}

enum EWasteItem : String
{
    case Newspaper = "newspaper"
    case Brass = "brass"
    case Laptop = "laptop"
    case Books = "books"
    case Cans = "cans"
    case Cardboard = "cardboard"
}

