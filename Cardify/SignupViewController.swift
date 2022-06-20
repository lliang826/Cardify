//
//  SignupViewController.swift
//  Cardify
//
//  Created by user218033 on 6/12/22.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sign Up"
        
        signupButton.layer.shadowColor = UIColor.gray.cgColor
        signupButton.layer.shadowOpacity = 1.0
        signupButton.layer.shadowOffset = CGSize(width: 10, height: 10)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
    }
}
