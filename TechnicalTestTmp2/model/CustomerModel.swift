//
//  CustomerModel.swift
//  TechnicalTestTmp2
//
//  Created by SiN on 8/7/2563 BE.
//  Copyright © 2563 SiN.Develop. All rights reserved.
//

import UIKit


struct CustomerModel:Codable {
    var id :String
    var customerGrade :String?
    var isCustomerPremium :Bool?
    var name :String
    var sex :String?
    var status :Int?
    
    init(id:String, customerGrade:String,isCustomerPremium:Bool, name:String, sex:String, status:Int){
        self.id = id
        self.customerGrade = customerGrade
        self.isCustomerPremium = isCustomerPremium
        self.name = name
        self.sex = sex
        self.status = status
    }
}
