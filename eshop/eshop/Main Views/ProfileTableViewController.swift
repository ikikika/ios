//
//  ProfileTableViewController.swift
//  eshop
//
//  Created by jit on 4/6/21.
//  Copyright © 2021 ikikika. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var finishRegistrationButtonOutlet: UIButton!
    @IBOutlet weak var purchaseHistoryButtonOutlet: UIButton!
    
    // MARK: Vars
    
    var editBarButtonOutlet: UIBarButtonItem!
    
    
    //MARK: - View LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView() // remove empty cells
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkLoginStatus()
        checkOnboardingStatus()
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return UITableViewCell()
//    }
    
    //MARK: - Helpers
    
    
    private func checkOnboardingStatus() {
        
        if MUser.currentUser() != nil {
            
            if MUser.currentUser()!.onBoard {
                finishRegistrationButtonOutlet.setTitle("Account is Active", for: .normal)
                finishRegistrationButtonOutlet.isEnabled = false
            } else {
                
                finishRegistrationButtonOutlet.setTitle("Finish registration", for: .normal)
                finishRegistrationButtonOutlet.isEnabled = true
                finishRegistrationButtonOutlet.tintColor = .red
            }
            
        } else {
            finishRegistrationButtonOutlet.setTitle("Logged out", for: .normal)
            finishRegistrationButtonOutlet.isEnabled = false
            purchaseHistoryButtonOutlet.isEnabled = false
        }
    }

    
    private func checkLoginStatus() {
        
        if MUser.currentUser() == nil {
            createRightBarButton(title: "Login")
        } else {
            createRightBarButton(title: "Edit")
        }
    }

    private func createRightBarButton(title: String) {
        
        editBarButtonOutlet = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(rightBarButtonItemPressed))
        editButtonItem.title = title
        self.navigationItem.rightBarButtonItem = editBarButtonOutlet
    }
    
    //MARK: - IBActions
    
    @objc func rightBarButtonItemPressed() {
        
        if editButtonItem.title == "Login" {
            showLoginView()
        } else {
            goToEditProfile()
        }
    }

   
   private func showLoginView() {
       
       let loginView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "loginView")
       
       self.present(loginView, animated: true, completion: nil)
   }
   
   private func goToEditProfile() {
       print("edit profile")
   }
  

}
