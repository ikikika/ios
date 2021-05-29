//
//  CategoryCollectionViewController.swift
//  eshop
//
//  Created by jit on 28/5/21.
//  Copyright © 2021 ikikika. All rights reserved.
//

// this file will show all our categories in the collection view

import UIKit

class CategoryCollectionViewController: UICollectionViewController {

    // Mark: vars
    var categoryArray: [Category] = [] // source of our collection
    
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // only need to run once to seed db with categories
        // createCategorySet()
        
        // test whether we can get categories from firebase
        // downloadCategoriesFromFirebase { (allCategories) in
        //    print("callback is completed")
        // }
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        loadCategories()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categoryArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CategoryCollectionViewCell
        
        return cell
    }
    
    // MARK: download categories
    
    private func loadCategories() {
        downloadCategoriesFromFirebase { (allCategories) in
            
//            print("we have ", allCategories.count)
            
            self.categoryArray = allCategories // save to array
            
            self.collectionView.reloadData() // refresh collection view after saving to array
        }
        
    }

    
}
