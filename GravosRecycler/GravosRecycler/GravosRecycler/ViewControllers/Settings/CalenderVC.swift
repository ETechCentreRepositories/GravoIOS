//
//  CalenderVC.swift
//  GravosRecycler
//
//  Created by Abhijit on 19/4/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit
import JBDatePicker

class CalenderVC: UIViewController,JBDatePickerViewDelegate,UITableViewDelegate,UITableViewDataSource
{
    
    
    @IBOutlet weak var datePicker: JBDatePickerView!
    @IBOutlet weak var leftBarButtonCal: UIBarButtonItem!
    @IBOutlet weak var rightbarBtnCal: UIBarButtonItem!
    @IBOutlet weak var navCalender: UINavigationItem!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
       datePicker.delegate = self
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        let sideMenu  = UIBarButtonItem(image: UIImage(named:"Icon_SideMenu"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(self.toggleSideMenu(_:)))
        sideMenu.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = sideMenu
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationItem.setHidesBackButton(true, animated: true)
        
        self.navCalender.title = datePicker.presentedMonthView?.monthDescription
    }
    
    @objc func toggleSideMenu(_ sender: Any)
    {
        toggleSideMenuView()
    }
    
    @IBAction func showNextMonth(_ sender: Any)
    {
        datePicker.loadNextView()
        
    }
    
    @IBAction func showPreviousMonth(_ sender: Any)
    {
         datePicker.loadPreviousView()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - JBDatePickerViewDelegate implementation
    
    func didPresentOtherMonth(_ monthView: JBDatePickerMonthView)
    {
         self.navCalender.title = datePicker.presentedMonthView?.monthDescription
        
    }
    func didSelectDay(_ dayView: JBDatePickerDayView) {
        print("date selected: \(String(describing: dayView.date))")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalenderCell", for: indexPath) as! CalenderCell
        
        return cell
    }
}
