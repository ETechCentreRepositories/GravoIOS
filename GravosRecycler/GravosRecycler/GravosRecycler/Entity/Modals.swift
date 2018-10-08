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


