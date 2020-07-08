//
//  Services.swift
//  TechnicalTestTmp2
//
//  Created by SiN on 8/7/2563 BE.
//  Copyright © 2563 SiN.Develop. All rights reserved.
//

import UIKit

class Services {
    
    func getLogin(username:String,password:String,completion:@escaping(LoginModel) ->()){
        
        guard let url = URL(string:"https://boomkorn.pythonanywhere.com/login") else{return}
        
        let body:[String:String] = ["username":username,"password":password]
        
        let bodySerialize = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = bodySerialize
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else {return}
            
            let loginObject = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject]
            
            DispatchQueue.main.async {
                
                let token = loginObject?["token"] as! String
                let status = loginObject?["status"] as! Int
                let customers = loginObject?["customers"] as! [[String: AnyObject]]
                
                let loginModel = LoginModel(status:status,token:token, customers: customers)
                
                completion(loginModel)
            }
        }
        session.resume()
    }
    
    func getCustomerDetail(token:String,customerId:String,completion:@escaping(CustomerModel) ->()){
        
        guard let url = URL(string:"https://boomkorn.pythonanywhere.com/getCustomerDetail") else{return}
        
        let body:[String:Any] = ["token":token,"customerId":customerId]
        
        let bodySerialize = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = bodySerialize
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else {return}
            
            let custDetailObject = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject]
            
            DispatchQueue.main.async {
            let status = custDetailObject?["status"] as! Int
            
            var name :String = ""
            var sex :String = ""
            var isCustomerPremium :Bool = false
            var id :String = ""
            var customerGrade :String = ""
            
                for data in custDetailObject?["data"] as! [String: AnyObject] {
                    
                    if data.key == "name" {
                        name = data.value as! String
                    }
                    if data.key == "sex" {
                        sex = data.value as! String
                    }
                    if data.key == "isCustomerPremium" {
                        isCustomerPremium = data.value as! Bool
                    }
                    if data.key == "id" {
                        id = data.value as! String
                    }
                    if data.key == "customerGrade" {
                        customerGrade = data.value as! String
                    }
                }
                completion(CustomerModel(id: id, customerGrade: customerGrade, isCustomerPremium: isCustomerPremium, name: name, sex: sex, status: status))
            }
        }
        session.resume()
    }
    
}
