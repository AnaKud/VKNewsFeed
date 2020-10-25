//
//  AuthViewController.swift
//  VKNewsFeed
//
//  Created by Анастасия Кудашева on 14.09.2020.
//  Copyright © 2020 Анастасия Кудашева. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    private var authServices: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authServices = SceneDelegate.shared().authService
        
        view.backgroundColor = .white
    }

    @IBAction func signTouch(_ sender: UIButton) {
        authServices.wakeUpSession()
    }
    
}

