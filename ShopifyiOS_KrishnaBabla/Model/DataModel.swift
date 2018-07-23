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
    private var dataModelOrders2017: fullOrderSummary
     private var dataModelOrders2:fullOrderSummary
    static var singleton = orderDataModel()
   
    
    init(){
        
    let ordersForInIt =  [orders]()
    self.dataModelOrders = fullOrderSummary(orders: ordersForInIt )
    self.dataModelOrders2017 = fullOrderSummary(orders: ordersForInIt)
    self.dataModelOrders2 = fullOrderSummary(orders: ordersForInIt )
    }
    
    func addDataToModel(Data: fullOrderSummary) -> Void {
        self.dataModelOrders = Data
        self.dataModelOrders2 = Data
        
        for index in 0...numberOfOrders()-1{
            if dataModelOrders.orders[index].created_at.contains("2017"){
                dataModelOrders2017.orders.append(dataModelOrders.orders[index]) 
            }
          

        }

            }
    
    func numberOfOrders() -> Int {
       return self.dataModelOrders.orders.count
    }
    
    func numberOfOrders2017() -> Int {
        return self.dataModelOrders2017.orders.count
    }
    
    func numberOfProvinces() -> Int {
        var intForReturn: Int = 0
        var arrayOfProvinces:[String] = [String]()
        arrayOfProvinces.append((dataModelOrders.orders[0].billing_address?.province)!)
        var provinceToCompare: String = (dataModelOrders.orders[0].billing_address?.province)!
         for index in 0...numberOfOrders()-1{
            if provinceToCompare == dataModelOrders.orders[index].billing_address?.province{
                for compare2 in arrayOfProvinces{
                    if provinceToCompare == compare2{
                        
                     break
                    }
                    else{
                        arrayOfProvinces.append(compare2)
                    }
                }
                intForReturn+=1
                provinceToCompare = (dataModelOrders.orders[index].billing_address?.province)!
            }
            else{
                
            }
        }
        print("array of Provinces Count: ")
        print(arrayOfProvinces.count)
        return intForReturn
    }
    
    func printForTableView(index: Int) -> String {
        var stringForReturn: String = ""
         let d = "---   $"+self.dataModelOrders2017.orders[index].total_price!
        guard let a = self.dataModelOrders2017.orders[index].billing_address?.last_name else{return "No Name Provided "+d }
        let b = ", "
        guard let c = (self.dataModelOrders2017.orders[index].billing_address?.first_name)else{return "no name provided"}
       
        
        stringForReturn = a+b+c+d
        return stringForReturn
        
    }
    
    func printByProvinceNumber(province: String) -> Int {
        var forReturn: Int = 0
        for index in 0...numberOfOrders()-1{
            if province == dataModelOrders.orders[index].billing_address?.province{
                forReturn+=1
            }
        }
        return forReturn
    }
    
    func printProvinceName() -> [String] {
        var names = [String]()
        for index in dataModelOrders.orders{
            if !names.contains(index.billing_address?.province ?? "none"){
        names.append(index.billing_address?.province ?? "none")
            if names.last == "none"{
                names.removeLast()
            }
            
            
        }
        }
        
        print("names array:")
        names = names.sorted {$0 < $1}
        print(names)
        return names
    }
    
//    func sort() -> Void {
//        dataModelOrders.orders = dataModelOrders.orders.sorted{$0.billing_address?.province ?? "none" < $1.billing_address?.province ?? "none" }
//
//        //print(dataModelOrders.orders)
//    }
    
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


