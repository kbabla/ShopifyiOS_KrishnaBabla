//
//  ViewController.swift
//  ShopifyiOS_KrishnaBabla
//
//  Created by Krishna Babla on 7/21/18.
//  Copyright © 2018 Krishna Babla. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dataModel:orderDataModel = orderDataModel.singleton
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
                print( dataModel.numberOfOrders())
            
                print(dataModel.printOrder(index: 0))
            }
                
            catch{
                print(error)
            }
            
        }
        catch {
            print("fail")
           
        }
       
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


