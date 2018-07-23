//
//  billAddressStructure.swift
//  ShopifyiOS_KrishnaBabla
//
//  Created by Krishna Babla on 7/22/18.
//  Copyright © 2018 Krishna Babla. All rights reserved.
//

import Foundation
//Data Structure for JSON Decoding
struct billingAddress: Decodable {
    let first_name: String
    let last_name: String
    let province: String
}
