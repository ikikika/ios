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
    
    private let sectionInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)
    private let itemsPerRow: CGFloat = 3
    
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
        
        cell.generateCell(categoryArray[indexPath.row])
        
        return cell
    }
    
    // MARK: UICollectionView Delegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "categoryToItemsSeg", sender: categoryArray[indexPath.row])
        
    }
    
    // MARK: download categories
    
    private func loadCategories() {
        downloadCategoriesFromFirebase { (allCategories) in
            
//            print("we have ", allCategories.count)
            
            self.categoryArray = allCategories // save to array
            
            self.collectionView.reloadData() // refresh collection view after saving to array
        }
        
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // check which segue is being called. important
        if segue.identifier == "categoryToItemsSeg" {
            let vc = segue.destination as! ItemsTableViewController
            vc.category = sender as! Category
        }
        
    }
    
}

extension CategoryCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow+1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = Int(availableWidth / itemsPerRow)
        
//        print([paddingSpace, view.frame.width, availableWidth, widthPerItem])
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
