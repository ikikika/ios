//
//  CategoryCollectionViewCell.swift
//  eshop
//
//  Created by jit on 28/5/21.
//  Copyright © 2021 ikikika. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func generateCell(_ category: Category) {
        nameLabel.text = category.name
        imageView.image = category.image
    }
    
}
