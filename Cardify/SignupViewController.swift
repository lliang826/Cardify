//
//  SignupViewController.swift
//  Cardify
//
//  Created by user218033 on 6/12/22.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sign Up"
        password.isSecureTextEntry = true
        
        signupButton.layer.shadowColor = UIColor.gray.cgColor
        signupButton.layer.shadowOpacity = 1.0
        signupButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        signupButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
    }
    
    @objc private func signUp() {
        guard let email = email.text, !email.isEmpty,
              let password = password.text, !password.isEmpty else {
            self.showErrorPopup(error: "Fields cannot be empty")
            return
        }
        
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] result, error in
            guard let strongSelf = self else { return }
            
            if let error = error {
                strongSelf.showErrorPopup(error: error.localizedDescription)
            } else {
                strongSelf.performSegue(withIdentifier: "signupToHome", sender: self)
            }
        })
    }
    
    func showErrorPopup(error: String) {
        let alert = UIAlertController(title: "Error",
                                      message: error,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {_ in
            
        }))
        
        present(alert, animated: true)
    }
}
