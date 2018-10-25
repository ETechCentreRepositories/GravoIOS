//
//  Modals.swift
//  GravosRecycler
//
//  Created by Ivan Lipotan on 27/9/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import Alamofire


class Result{
	var id: String = ""
	var item: String = ""
	var rate: String = ""
	var points: String = ""
	var c02_points: String = ""
	var achievement_tag: String = ""
	
	
	required init(id: String, item: String, rate: String, points: String, c02_points: String,achievement_tag: String) {
		self.id = id
		self.item = item
		self.rate = rate
		self.points = points
		self.c02_points = c02_points
		self.achievement_tag = achievement_tag
	}
}
class CartItem{
	var cartid: String = ""
	var cartrecycleid: String = ""
	var category_id: String = ""
	var id: String = ""
	var price: String = ""
	var weight : String = ""
	
	
	required init(cartid: String, cartrecycleid: String, category_id: String, id: String, price: String,weight: String) {
		self.cartid = cartid
		self.cartrecycleid = cartrecycleid
		self.category_id = category_id
		self.id = id
		self.price = price
		self.weight = weight
	}
	
	
}

class LeaderBoardItem{
	var achievement_name: String = ""
	var achievement_id: String = ""
	var achievements_recycler_id: String  = ""
	var category_id : String = ""
	var id: String = ""
	var points: String = ""
	
	required init(achievement_name : String, achievement_id: String, achievements_recycler_id: String, category_id: String, id: String, points: String){
		
		self.achievement_name = achievement_name
		self.achievement_id = achievement_id
		self.achievements_recycler_id = achievements_recycler_id
		self.category_id = category_id
		self.id = id
		self.points = points
	}
	
}



