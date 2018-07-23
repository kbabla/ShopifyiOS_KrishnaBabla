//
//  ViewController.swift
//  ShopifyiOS_KrishnaBabla
//
//  Created by Krishna Babla on 7/21/18.
//  Copyright © 2018 Krishna Babla. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tableViewProvince: UITableView!
    @IBOutlet weak var tableViewYear: UITableView!
    @IBOutlet weak var labelProvince: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    let dataModel:orderDataModel = orderDataModel.singleton
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var json:JSON
        var data:Data
        let file = "https://shopicruit.myshopify.com/admin/orders.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
        let url = URL(string: file)
        do {
            
            data = try Data(contentsOf: url!)
            
            json = try JSON(data: data)
            let decoder = JSONDecoder()
            do{
                let todo = try decoder.decode(fullOrderSummary.self, from: data)
                dataModel.addDataToModel(Data: todo)
        
            }
                
            catch{
                print(error)
            }
            
        }
        catch {
            print("fail")
           
        }
        
        labelProvince.text = "  Orders by Province"
        guard let numberIn2017:String = String(dataModel.numberOfOrders2017()) else{}
        labelYear.text = "  Orders in 2017-- "+numberIn2017+" Total"
        
        for index in 0...dataModel.numberOfOrders()-1{
            print(dataModel.printOrder(index: index))
        }
       
       
        
    }
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows = 1
        if tableView == tableViewProvince{
           numberOfRows = dataModel.numberOfProvinces()
        }
        if tableView == tableViewYear{
           numberOfRows = dataModel.numberOfOrders2017()
        }
        
       
        return numberOfRows
        
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var whichCell: UITableViewCell!
       
        
        if tableView == tableViewProvince{
            
            whichCell = tableView.dequeueReusableCell(withIdentifier: "cellForProvince", for: indexPath)
            whichCell.textLabel?.text = dataModel.printProvinceName()[indexPath.row]
            let numberPerProvince = dataModel.printByProvinceNumber(province: dataModel.printProvinceName()[indexPath.row])
            whichCell.detailTextLabel?.text = String(numberPerProvince)
        }
        if tableView == tableViewYear{
              
            whichCell = tableView.dequeueReusableCell(withIdentifier: "cellForYear", for: indexPath)
            whichCell.textLabel?.text = dataModel.printForTableView(index: indexPath.row)
        }
        
       
        
        return whichCell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


