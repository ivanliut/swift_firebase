//
//  LoginController.swift
//  app-firebase
//
//  Created by administrator on 6/1/19.
//  Copyright © 2019 administrator. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Don't have an account ? Sign up.", for: .normal)
        button.addTarget(self, action: #selector(handleShowsignUp), for: .touchUpInside)
        return button
    }()
    
    @objc func handleShowsignUp() {
        let signUpController = SignUpController()
        print(navigationController)
        navigationController?.pushViewController(signUpController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(signUpButton)
        signUpButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
    }
}
