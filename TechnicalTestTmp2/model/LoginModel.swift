//
//  LoginModel.swift
//  TechnicalTestTmp2
//
//  Created by SiN on 8/7/2563 BE.
//  Copyright © 2563 SiN.Develop. All rights reserved.
//

import Foundation

struct LoginModel {
    var status :Int
    var token :String
    var customers : [[String:AnyObject]]
    
    init(status:Int,token:String,customers:[[String:AnyObject]]){
        self.status = status
        self.token = token
        self.customers = customers
    }
}

