//
//  ItemsTableViewController.swift
//  eshop
//
//  Created by jit on 30/5/21.
//  Copyright © 2021 ikikika. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {

    // MARK: Vars
    var category: Category?
    var itemArray: [Item] = []

    //MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        
        self.title = category?.name
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if category != nil {
            loadItems()
        }
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemTableViewCell

        cell.generateCell(itemArray[indexPath.row])
        
        return cell
    }



    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "itemToAddItemSeg" {
            let vc = segue.destination as! AddItemViewController
            
            // everytime we tap from category to add item, we will have access to category
            vc.category = category!
        }
    }
    
    //MARK: Load Items
    private func loadItems() {
        downloadItemsFromFirebase(category!.id) { (allItems) in
//            print("we have \(allItems.count) items for this category")
            self.itemArray = allItems
            self.tableView.reloadData()
        }
    }


    

}
