//
//  ViewController.swift
//  app-firebase
//
//  Created by administrator on 5/10/19.
//  Copyright © 2019 administrator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let plusPhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add-image"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor(white: 0, alpha: 0.07)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 17)
        return tf
    }()
    
    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor(white: 0, alpha: 0.07)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 17)
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor(white: 0, alpha: 0.07)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 17)
        return tf
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(plusPhotoButton)
        
        plusPhotoButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        plusPhotoButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        plusPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        plusPhotoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        
//        view.addSubview(emailTextField)
        
        setupInputFields()
        
//        NSLayoutConstraint.activate([
//            emailTextField.topAnchor.constraint(equalTo: plusPhotoButton.bottomAnchor, constant: 20),
//            emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
//            emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
//            emailTextField.heightAnchor.constraint(equalToConstant: 50)
//            ])
        
    }
    
    fileprivate func setupInputFields() {
        let stackView = UIStackView(arrangedSubviews: [
            emailTextField,
            usernameTextField,
            passwordTextField,
            signUpButton
            ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
                    stackView.topAnchor.constraint(equalTo: plusPhotoButton.bottomAnchor, constant: 20),
                    stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
                    stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
                    stackView.heightAnchor.constraint(equalToConstant: 200)
                    ])
    }


}

