//
//  Category.swift
//  eshop
//
//  Created by jit on 29/5/21.
//  Copyright © 2021 ikikika. All rights reserved.
//

import Foundation
import UIKit

class Category {
    
    var id: String
    var name: String
    var image: UIImage?
    var imageName: String?
    
    init(_name: String, _imageName: String){
        
        id = ""
        name = _name
        imageName = _imageName
        image = UIImage(named: _imageName)
    }
    
    init(_dictionary: NSDictionary) {
        
        id = _dictionary["objectId"] as! String
        name = _dictionary["name"] as! String
        image = UIImage(named: _dictionary["imageName"] as? String ?? "")
        
    }
    
}
