//
//  FirebaseCollectionReference.swift
//  eshop
//
//  Created by jit on 28/5/21.
//  Copyright © 2021 ikikika. All rights reserved.
//

import Foundation
import FirebaseFirestore


// create a reference so that we dun have to write long lines to access diff sections in our db
enum FCollectionReference: String {
    case User // user directory
    case Category // catgory directory
    case Items // all items in sales section
    case Basket // each user will have their own basket
    // these are the sections in our firebase
}

// show path to each directory in fb
func FirebaseReference(_ collectionReference: FCollectionReference )
    -> CollectionReference {
        
        return Firestore.firestore().collection(collectionReference.rawValue)
}
