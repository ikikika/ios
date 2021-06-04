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
    
    //MARK: - Helpers
    
    private func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }


    
}
