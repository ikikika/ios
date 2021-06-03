//
//  ImageCollectionViewCell.swift
//  eshop
//
//  Created by jit on 2/6/21.
//  Copyright © 2021 ikikika. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setupImageWith(itemImage: UIImage) {
        
        imageView.image = itemImage
    }

}
