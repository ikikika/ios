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

    override func viewDidLoad() {
        super.viewDidLoad()

        // only need to run once to seed db with categories
        // createCategorySet()
        
        // test whether we can get categories from firebase
        // downloadCategoriesFromFirebase { (allCategories) in
        //    print("callback is completed")
        // }
        
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                    
        return UICollectionViewCell()
    }

    
}
