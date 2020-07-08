//
//  ViewController.swift
//  TechnicalTestTmp2
//
//  Created by SiN on 8/7/2563 BE.
//  Copyright © 2563 SiN.Develop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userNameTextField :UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Username"
        textfield.font = UIFont.systemFont(ofSize: 24)
        textfield.borderStyle = .roundedRect
        textfield.autocapitalizationType = .none
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    var passwordTextField :UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
        textfield.font = UIFont.systemFont(ofSize: 24)
        textfield.borderStyle = .roundedRect
        textfield.isSecureTextEntry = true
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    var loginBtn :UIButton = {
        let btn = UIButton()
        btn.setTitle("Sign in", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor.blue
        btn.addTarget(self, action: #selector(getLoggedin), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    
    func setupView(){
        self.view.addSubview(self.userNameTextField)
        self.view.addSubview(self.passwordTextField)
        self.view.addSubview(self.loginBtn)
        
        self.userNameTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        self.userNameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        self.userNameTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor,constant: -100).isActive = true
        
        self.passwordTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        self.passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        self.passwordTextField.topAnchor.constraint(equalTo: self.userNameTextField.bottomAnchor,constant:40).isActive = true
        
        self.loginBtn.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        self.loginBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.loginBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        self.loginBtn.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor,constant:40).isActive = true
        
    }
    
    @objc func getLoggedin(){
        performSegue(withIdentifier: "getUser", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "getUser"{
            let username = self.userNameTextField.text ?? ""
            let password = self.passwordTextField.text ?? ""
            
            guard let cust = segue.destination as? CustomerListViewController else{return}
            cust.username = username
            cust.password = password
        }
    }
}

