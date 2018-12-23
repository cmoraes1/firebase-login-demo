//
//  ViewController.swift
//  FirebaseLogin
//
//  Created by Camilla Moraes on 12/6/18.
//  Copyright © 2018 Camilla Moraes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {


    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var resetPasswordButton: UIButton!
    let registerVC = RegisterViewController()
    
    @IBAction func resetPasswordAction(_ sender: Any) {
        performSegue(withIdentifier: "ResetPasswordSegueID", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.isSecureTextEntry = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUpPressed(_ sender: Any) {
        performSegue(withIdentifier: "RegisterSegueID", sender: self)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if self.usernameField.text == "" || self.passwordField.text == "" {
            //tell user there was an error because they didn't fill anything out
            let alertController = UIAlertController(title: "Error,", message: "Please enter an email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().signIn(withEmail: self.usernameField.text!, password: self.passwordField.text!) { (user, error) in
                if error == nil {
                    print("You have successfully logged in")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                } else {
                    //tells user there is an error and gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        
        
    }
    
    
}

