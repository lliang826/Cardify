//
//  LoginViewController.swift
//  Cardify
//
//  Created by user218033 on 6/12/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
        passwordTextField.isSecureTextEntry = true
        
        loginButton.layer.shadowColor = UIColor.gray.cgColor
        loginButton.layer.shadowOpacity = 1.0
        loginButton.layer.shadowOffset = CGSize(width: 10, height: 10)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
    }
    
    @objc private func login() {
        print("login button tapped")
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            self.showErrorPopup(error: "Fields cannot be empty")
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            guard let strongSelf = self else { return }
            
            if let error = error {
                strongSelf.showErrorPopup(error: error.localizedDescription)
            } else {
                strongSelf.performSegue(withIdentifier: "loginToHome", sender: self)
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
