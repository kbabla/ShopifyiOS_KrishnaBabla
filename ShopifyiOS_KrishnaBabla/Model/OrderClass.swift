//
//  OrderClass.swift
//  ShopifyiOS_KrishnaBabla
//
//  Created by Krishna Babla on 7/21/18.
//  Copyright © 2018 Krishna Babla. All rights reserved.
//

import Foundation

struct orders: Codable{
    var province:String
    var email:String
    var created_at:String
    var first_name:String
    var last_name:String
    var total_price_usd:Double
    
    init(province:String, email:String, created_at: String, first_name: String, last_name:String, total_price_usd: Double){
        self.province = province
        self.email = email
        self.created_at = created_at
        self.first_name = first_name
        self.last_name = last_name
        self .total_price_usd = total_price_usd
    }
    
}


