//
//  CustomerDetailViewController.swift
//  TechnicalTestTmp2
//
//  Created by SiN on 8/7/2563 BE.
//  Copyright © 2563 SiN.Develop. All rights reserved.
//

import UIKit


class CustomerDetailViewController: UIViewController {
    
    var custName :UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont.systemFont(ofSize:17)
    lbl.textColor = UIColor.black
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
    }()
    
    var sex :UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont.systemFont(ofSize:17)
    lbl.textColor = UIColor.black
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
    }()
    
    var id :UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont.systemFont(ofSize:17)
    lbl.textColor = UIColor.black
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
    }()
    
    var customerGrade :UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont.systemFont(ofSize:17)
    lbl.textColor = UIColor.black
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
    }()
    
    var isCustomerPremium :UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont.systemFont(ofSize:17)
    lbl.textColor = UIColor.black
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
    }()
    
    var token :String?
    var customerId :String?
    var custModel :CustomerModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Services().getCustomerDetail(token: self.token ?? "", customerId: self.customerId ?? "") { (data) in
            self.custModel = data
        }
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        self.setupView()
        }
    }
    
    func setupView(){
        self.view.addSubview(self.custName)
        self.view.addSubview(self.sex)
        self.view.addSubview(self.id)
        self.view.addSubview(self.customerGrade)
        self.view.addSubview(self.isCustomerPremium)
        
        self.custName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.custName.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.custName.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.custName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        
        self.sex.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.sex.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.sex.topAnchor.constraint(equalTo: self.custName.bottomAnchor, constant: 10).isActive = true
        self.sex.leadingAnchor.constraint(equalTo: self.custName.leadingAnchor).isActive = true
        
        self.id.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.id.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.id.topAnchor.constraint(equalTo: self.sex.bottomAnchor, constant: 10).isActive = true
        self.id.leadingAnchor.constraint(equalTo: self.custName.leadingAnchor).isActive = true
        
        self.customerGrade.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.customerGrade.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.customerGrade.topAnchor.constraint(equalTo: self.id.bottomAnchor, constant: 10).isActive = true
        self.customerGrade.leadingAnchor.constraint(equalTo: self.custName.leadingAnchor).isActive = true
        
        self.isCustomerPremium.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.isCustomerPremium.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.isCustomerPremium.topAnchor.constraint(equalTo: self.customerGrade.bottomAnchor, constant: 10).isActive = true
        self.isCustomerPremium.leadingAnchor.constraint(equalTo: self.custName.leadingAnchor).isActive = true
        
        if let custDetail = self.custModel {
        self.custName.text = "Customer name :\(String(describing:custDetail.name))"
            self.sex.text = "Gender :\(custDetail.sex ?? "")"
        self.id.text = "Id :\(String(describing: custDetail.id))"
            self.customerGrade.text = "Grade  :\(custDetail.customerGrade ?? "")"
        self.isCustomerPremium.text = "Premium :\(custDetail.isCustomerPremium ?? false ? "Yes" : "No")"
        }
    }
}
