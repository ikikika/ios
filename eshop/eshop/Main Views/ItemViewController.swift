//
//  ItemViewController.swift
//  eshop
//
//  Created by jit on 2/6/21.
//  Copyright © 2021 ikikika. All rights reserved.
//

import UIKit
import JGProgressHUD

class ItemViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    //MARK: - Vars
    var item: Item!
    var itemImages: [UIImage] = []
    let hud = JGProgressHUD(style: .dark)
    
    //MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("Item Name is ", item.name)
        setupUI()
        downloadPictures()
    }
    
    
    // MARK: Download pictures
    
    private func downloadPictures() {
        
        if item != nil && item.imageLinks != nil {
            downloadImages(imageUrls: item.imageLinks) { (allImages) in
                if allImages.count > 0 {
                    self.itemImages = allImages as! [UIImage]
                    self.imageCollectionView.reloadData()
                }
            }
        }
        
    }
    
    // MARK: Setup UI
    
    private func setupUI() {
        
        if item != nil {
            
            self.title = item.name
            nameLabel.text = item.name
            priceLabel.text = convertToCurrency(item.price)
            descriptionTextView.text = item.description
        }
    }
}

extension ItemViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        return itemImages.count == 0 ? 1 : itemImages.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCollectionViewCell
        
        if itemImages.count > 0 {
            cell.setupImageWith(itemImage: itemImages[indexPath.row])
        }
        
        return cell

    }
    
    
}
