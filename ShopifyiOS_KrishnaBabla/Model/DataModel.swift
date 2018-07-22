//
//  DataModel.swift
//  ShopifyiOS_KrishnaBabla
//
//  Created by Krishna Babla on 7/21/18.
//  Copyright © 2018 Krishna Babla. All rights reserved.
//

import Foundation
class orderDataModel{

    
    private var dataModelOrders:fullOrderSummary
    static var singleton = orderDataModel()
   
    
    init(){
        
    let ordersForInIt =  [orders]()
    self.dataModelOrders = fullOrderSummary(orders: ordersForInIt )
        
    }
    
    func addDataToModel(Data: fullOrderSummary) -> Void {
        self.dataModelOrders = Data
    }
    
    func numberOfOrders() -> Int {
       return self.dataModelOrders.orders.count
    }
    
    func printOrder(index: Int) -> [Any] {
        var orderForReturn = [Any]()
        orderForReturn.append(self.dataModelOrders.orders[index].id)
        orderForReturn.append(self.dataModelOrders.orders[index].created_at)
        orderForReturn.append(self.dataModelOrders.orders[index].billing_address?.first_name ?? "none")
        orderForReturn.append(self.dataModelOrders.orders[index].billing_address?.last_name ?? "none")
        orderForReturn.append(self.dataModelOrders.orders[index].email)
        orderForReturn.append(self.dataModelOrders.orders[index].billing_address?.province ?? "none")
        orderForReturn.append(self.dataModelOrders.orders[index].total_price ?? "none")
       
        return orderForReturn
    }

}


