//
//  WelcomeViewController.swift
//  eshop
//
//  Created by jit on 4/6/21.
//  Copyright © 2021 ikikika. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var resendButton: UIButton!
    
    
    // MARK: VIew lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: IBActions
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        print("cancel")
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        print("login")
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        print("register")
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        print("forgot")
    }
    
    @IBAction func resendEmailButtonPressed(_ sender: Any) {
        print("resend")
    }
    
}
