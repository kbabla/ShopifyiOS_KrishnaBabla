//
//  OrderClass.swift
//  ShopifyiOS_KrishnaBabla
//
//  Created by Krishna Babla on 7/21/18.
//  Copyright © 2018 Krishna Babla. All rights reserved.
//
//
import Foundation

struct orders: Decodable {
    let id: Int
    let email: String
    let created_at: String
    let billing_address: billingAddress?
    let total_price: String?
    
}




