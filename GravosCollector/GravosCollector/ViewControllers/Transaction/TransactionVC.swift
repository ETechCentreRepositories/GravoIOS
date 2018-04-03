//
//  TransactionVC.swift
//  GravosCollector
//
//  Created by Abhijit on 26/3/18.
//  Copyright © 2018 Abhijit. All rights reserved.
//

import UIKit

class TransactionVC: UIViewController, UITableViewDataSource,UITableViewDelegate,UITableViewDataSourcePrefetching
{
    @IBOutlet weak var tblTransactionItems: UITableView!
    @IBOutlet weak var lblTotalWeight: UILabel!
    @IBOutlet weak var lblTotalValue: UILabel!
    
    var arrTransactions : [entTransactionItem]?
    var arrCatagories = [Category]()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        tblTransactionItems.delegate = self
        tblTransactionItems.dataSource = self
        tblTransactionItems.estimatedRowHeight = UITableViewAutomaticDimension
        tblTransactionItems.rowHeight = UITableViewAutomaticDimension
        tblTransactionItems.tableFooterView = UIView()
        
        self.fetchCatagories()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func fetchCatagories()
    {
        let dh = DataHandler()
        
        dh.fetchRemoteData(inputAddress: APIaddress.categories.rawValue, completion: {
            (result: Any)   in
            DispatchQueue.main.async
                {
               self.arrCatagories = result as! [Category]
            }
            
            //print(arrCatagories)
        } )
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath])
    {
        //--
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCustomCell", for: indexPath) as! TransactionCustomCell
        
        //cell.btnNavigate.addTarget(self, action: #selector(self.performNavigation)    , for: .touchUpInside)
        
        
        return cell
    }
    @IBAction func addItem(_ sender: Any)
    {
        let addItemVC = self.storyboard?.instantiateViewController(withIdentifier: "AddItemVC") as! AddItemVC
        addItemVC.arrCategories = self.arrCatagories
        self.addChildViewController(addItemVC)
        addItemVC.view.frame = self.view.frame
        self.view.addSubview(addItemVC.view)
        addItemVC.didMove(toParentViewController: self)
        
        
    }
    
    @IBAction func addRecipitant(_ sender: Any)
    {
        let alertController = UIAlertController(title: "Add Recipitant", message: "", preferredStyle: .alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Name"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Contact Number"
        }
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            print("firstName \(String(describing: firstTextField.text) ), secondName \(String(describing: secondTextField.text))")
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action : UIAlertAction!) -> Void in })
        
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func performCashCollected(_ sender: Any)
    {
        
    }
    
}
