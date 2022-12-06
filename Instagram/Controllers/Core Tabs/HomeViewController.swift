//
//  ViewController.swift
//  Instagram
//
//  Created by kamilcal on 4.12.2022.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleNotAuthenticated()
    }

    private func handleNotAuthenticated() {
//        kimlik doğrulama durumunu kontrol et
        if Auth.auth().currentUser == nil {
//            show log in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
            
        }
    }

}

