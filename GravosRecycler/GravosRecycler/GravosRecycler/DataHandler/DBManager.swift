//
//  DBManager.swift
//  GravosRecycler
//
//  Created by Abhijit on 28/5/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import FMDB

class DBManager: NSObject
{
	
	let field_UserID = "ID"
	let field_UserFirstName = "firstname"
	let field_UserLastName = "lastname"
	let field_UserContact = "contactnumber"
	let field_UserAddress = "address"
	let field_Email = "email"
	
	
	static let shared: DBManager = DBManager()
	
	let databaseFileName = "database.sqlite"
	
	var pathToDatabase: String!
	
	var database: FMDatabase!
	
	override init()
	{
		super.init()
		
		let documentsDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
		pathToDatabase = documentsDirectory.appending("/\(databaseFileName)")
	}
	
	func createDatabase() -> Bool {
		var created = false
		
		if !FileManager.default.fileExists(atPath: pathToDatabase) {
			database = FMDatabase(path: pathToDatabase!)
			
			if database != nil {
				// Open the database.
				if database.open() {
					
					self.createBaseTables(currentdatabase: database)
					database.close()
				}
				else {
					print("Could not open the database.")
				}
			}
		}
		
		return created
	}
	
	
	func openDatabase() -> Bool
	{
		if database == nil
		{
			if FileManager.default.fileExists(atPath: pathToDatabase) {
				database = FMDatabase(path: pathToDatabase)
				print(pathToDatabase)
			}
		}
		if database != nil {
			if database.open() {
				return true
			}
		}
		
		return false
	}
	
	func createBaseTables(currentdatabase: FMDatabase)
	{
		let createUsersTableQuery = "create table users (\(field_UserID) integer primary key autoincrement not null, \(field_UserFirstName) text not null, \(field_UserLastName) text not null, \(field_UserContact) text not null, \(field_Email) text, \(field_UserAddress) text not null)"
		
		do {
			try currentdatabase.executeUpdate(createUsersTableQuery, values: nil)
		}
		catch {
			print("Could not create table.")
			print(error.localizedDescription)
		}
		
		
	}
	
	func insertUserData(userDetails: LoggedInUsers)
	{
		if openDatabase()
		{
					print(pathToDatabase)
					var query = ""
					query += "insert into users (\(field_UserID), \(field_UserFirstName), \(field_UserLastName), \(field_UserContact), \(field_UserAddress), \(field_Email)) values (null, '\(userDetails.firstname)', '\(userDetails.lastname)', \(userDetails.contact), '\(userDetails.address)', '\(userDetails.email)');"
					
					if !database.executeStatements(query)
					{
						print("Failed to insert initial data into the database.")
						print(database.lastError(), database.lastErrorMessage())
					}
			}
			
			database.close()
	}
	
	func deleteallUserData()
	{
		if openDatabase()
		{
			print(pathToDatabase)
			var query = ""
			query += "DELETE FROM users WHERE field_UserID='1';"
			
			if !database.executeStatements(query)
			{
				print("Failed to delete the database.")
				print(database.lastError(), database.lastErrorMessage())
			}
		}
		
		database.close()
	}
	
	func getUserDetails() -> [LoggedInUsers]
	{
		let user = LoggedInUsers()
		if openDatabase()
		{
			print(pathToDatabase)
			var query = ""
			query += "SELECT * FROM users;"
			
			do {
				print(database)
				let results = try database.executeQuery(query, values: nil)
				
				while results.next()
				{
					user.id = "\(results.int(forColumn: field_UserID))"
					user.firstname = (results.string(forColumn: field_UserFirstName))!
					user.lastname = (results.string(forColumn: field_UserLastName))!
					user.contact = (results.string(forColumn: field_UserContact))!
					user.email = (results.string(forColumn: field_Email))!
					user.address = (results.string(forColumn: field_UserAddress))!
					
				}
				
			}
			catch {
				print(error.localizedDescription)
			}
		}
		
		return [user]
	}
}
