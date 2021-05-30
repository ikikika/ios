//
//  AddItemViewController.swift
//  eshop
//
//  Created by jit on 30/5/21.
//  Copyright © 2021 ikikika. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: Vars
    var category: Category! // pass category through action
    var itemImages: [UIImage?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        print(category.id)
    }
    

    // Mark: IBActions
    @IBAction func doneBarButtonItemPressed(_ sender: Any) {
        
        dismissKeyboard()
        
        if fieldsAreCompleted() {
            // print("We have values")
            saveToFirebase()
            
        } else {
            print("Error all fields are required")
            // TODO: SHow error to user
        }
    }
    
    @IBAction func cameraButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func backgroundTapped(_ sender: Any) {
        dismissKeyboard()
    }
    
    // MARK: Helper functions
    
    private func fieldsAreCompleted() -> Bool {
        return (
            titleTextField.text != "" &&
            priceTextField.text != "" &&
            descriptionTextView.text != ""
        )
    }
    
    private func dismissKeyboard(){
        self.view.endEditing(false)
    }
    
    private func popTheView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: Save Item
    private func saveToFirebase() {
        
        let item = Item()
        item.id = UUID().uuidString
        item.name = titleTextField.text!
        item.categoryId = category.id
        item.description = descriptionTextView.text
        item.price = Double(priceTextField.text!)
        
        if itemImages.count > 0 {
            
            
        } else {
            saveItemToFirestore(item)
            popTheView()
        }
        
    }

    
}
