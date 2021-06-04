//
//  WelcomeViewController.swift
//  eshop
//
//  Created by jit on 4/6/21.
//  Copyright © 2021 ikikika. All rights reserved.
//

import UIKit
import JGProgressHUD
import NVActivityIndicatorView

class WelcomeViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var resendButton: UIButton!
    
    //MARK: - Vars
    
    let hud = JGProgressHUD(style: .dark)
    var activityIdicator: NVActivityIndicatorView?
    
        
    // MARK: VIew lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        activityIdicator = NVActivityIndicatorView(frame: CGRect(x: self.view.frame.width / 2 - 30, y: self.view.frame.height / 2 - 30, width: 60.0, height: 60.0), type: .ballPulse, color: #colorLiteral(red: 0.9998469949, green: 0.4941213727, blue: 0.4734867811, alpha: 1.0), padding: nil)
    }

    
    // MARK: IBActions
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
//        print("cancel")
        
        dismissView()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
//        print("login")
        
        if textFieldsHaveText() {
            
            loginUser()
        } else {
            hud.textLabel.text = "All fields are required"
            hud.indicatorView = JGProgressHUDErrorIndicatorView()
            hud.show(in: self.view)
            hud.dismiss(afterDelay: 2.0)
        }

        
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
       
//        print("register")
        
        if textFieldsHaveText() {
            
            registerUser()
        } else {
            hud.textLabel.text = "All fields are required"
            hud.indicatorView = JGProgressHUDErrorIndicatorView()
            hud.show(in: self.view)
            hud.dismiss(afterDelay: 2.0)
        }
        
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        print("forgot")
    }
    
    @IBAction func resendEmailButtonPressed(_ sender: Any) {
        print("resend")
    }
    
    
    // MARK Register users
    
    private func registerUser() {
        
        showLoadingIndicator()
        
        MUser.registerUserWith(email: emailTextField.text!, password: passwordTextField.text!) { (error) in
            
            if error == nil {
                self.hud.textLabel.text = "Verification Email sent!"
                self.hud.indicatorView = JGProgressHUDSuccessIndicatorView()
                self.hud.show(in: self.view)
                self.hud.dismiss(afterDelay: 2.0)
            } else {
                print("error registering", error!.localizedDescription)
                self.hud.textLabel.text = error!.localizedDescription
                self.hud.indicatorView = JGProgressHUDErrorIndicatorView()
                self.hud.show(in: self.view)
                self.hud.dismiss(afterDelay: 2.0)
            }
            
            
            self.hideLoadingIndicator()
        }
        
    }
    
    //MARK: - Login User
    
    private func loginUser() {
        
        showLoadingIndicator()
        
        MUser.loginUserWith(email: emailTextField.text!, password: passwordTextField.text!) { (error, isEmailVerified) in
            
            if error == nil {
                
                if  isEmailVerified {
                    self.dismissView()
                    print("Email is verified")
                } else {
                    self.hud.textLabel.text = "Please verify your email!"
                    self.hud.indicatorView = JGProgressHUDErrorIndicatorView()
                    self.hud.show(in: self.view)
                    self.hud.dismiss(afterDelay: 2.0)
                }
                
            } else {
                print("error logging in the user", error!.localizedDescription)
                self.hud.textLabel.text = error!.localizedDescription
                self.hud.indicatorView = JGProgressHUDErrorIndicatorView()
                self.hud.show(in: self.view)
                self.hud.dismiss(afterDelay: 2.0)
            }
            
            
            self.hideLoadingIndicator()
        }
        
    }


    
    //MARK: - Helpers
    
    private func textFieldsHaveText() -> Bool {
        return (emailTextField.text != "" && passwordTextField.text != "")
    }
    
    private func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: Activity Indicator
    
    private func showLoadingIndicator () {
        
        if activityIdicator != nil {
            self.view.addSubview(activityIdicator!)
            activityIdicator!.startAnimating()
        }
        
    }
    
    private func hideLoadingIndicator () {
        
        if activityIdicator != nil {
            activityIdicator!.removeFromSuperview()
            activityIdicator!.stopAnimating()
        }
        
    }
    
}
