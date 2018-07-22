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
    
    
    struct largeorders:Decodable{
        let orders: [orders]
        
    }
    struct orders: Decodable {
        let id: Int
        let email: String
        let created_at: String
        let billing_address: billingAddress?
        let total_price: String?
        
    }
    
    struct billingAddress: Decodable {
        let first_name: String
        let last_name: String
        let province: String
    }

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
                let todo = try decoder.decode(largeorders.self, from: data)
                print(todo.orders[5].total_price)
            }
                
            catch{
                print(error)
            }
            
            //print(json["orders"][5])
            //
        }
        catch {
            print("fail")
            // viewController.json = JSON.null
        }
        //call singleton
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


