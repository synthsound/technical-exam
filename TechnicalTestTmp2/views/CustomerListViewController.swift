//
//  CustomerListViewController.swift
//  TechnicalTestTmp2
//
//  Created by SiN on 8/7/2563 BE.
//  Copyright © 2563 SiN.Develop. All rights reserved.
//

import UIKit

class CustomerListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var loginModel : LoginModel?
    var username :String?
    var password :String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Services().getLogin(username: self.username ?? "", password: self.password ?? "") { (data) in
            self.loginModel = data
            self.customerListTableView.reloadData()
        }
        self.customerListTableView.delegate = self
        self.customerListTableView.dataSource = self
        self.setupView()
        self.customerListTableView.reloadData()
    }
    
    var customerListTableView :UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.white
        table.allowsSelection = true
        table.register(UITableViewCell.self, forCellReuseIdentifier: "customerTableView")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var logoutBtn :UIButton = {
        let btn = UIButton()
        btn.setTitle("sign out", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor.blue
        btn.addTarget(self, action: #selector(logout), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupView() {
        self.view.addSubview(self.customerListTableView)
        self.view.addSubview(self.logoutBtn)
        
        
        self.logoutBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.logoutBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.logoutBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.logoutBtn.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        self.customerListTableView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        self.customerListTableView.topAnchor.constraint(equalTo: self.logoutBtn.bottomAnchor,constant: 10).isActive = true
        self.customerListTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.customerListTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.customerListTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.loginModel?.customers.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "customerTableView")
        
        cell.textLabel?.text = self.loginModel?.customers[indexPath.row]["name"] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let customerId = self.loginModel?.customers[indexPath.row]["id"] as! String
        
        performSegue(withIdentifier: "customerDetails",sender: customerId)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "customerDetails" {
        guard let custDetail = segue.destination as? CustomerDetailViewController else{return}
        custDetail.token = self.loginModel?.token
        custDetail.customerId = sender as? String
        }
        
        if segue.identifier == "LoginPage" {
             guard let _ = segue.destination as? ViewController else{return}
        }
    }
    
    @objc func logout(){
        self.loginModel?.customers.removeAll()
        self.loginModel?.token = ""
        self.loginModel?.status = 0
        self.customerListTableView.reloadData()
        
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "password")
        
        performSegue(withIdentifier: "LoginPage",sender: nil)
    }
    
}

class CustomerListViewCell :UITableViewCell {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
