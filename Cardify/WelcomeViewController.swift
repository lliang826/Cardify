//
//  ViewController.swift
//  Cardify
//
//  Created by user218033 on 6/10/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.shadowColor = UIColor.gray.cgColor
        loginButton.layer.shadowOpacity = 1.0
        loginButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        signupButton.layer.shadowColor = UIColor.gray.cgColor
        signupButton.layer.shadowOpacity = 1.0
        signupButton.layer.shadowOffset = CGSize(width: 10, height: 10)
    }
    

}

