//
//  LawTypes.swift
//  SIP Justyna
//
//  Created by Radosław Stelmasiak on 14.01.2017.
//  Copyright © 2017 Radoslaw Stelmasiak. All rights reserved.
//

import Foundation

class LawTypes {
    
    private var postId:Int;
    private var categoryTitle: String;
    
    var PostId: Int {
        get {
            return postId
        }
        set {
            postId = newValue
        }
        }
    
    var CategoryTitle: String {
        get {
            return categoryTitle
        }
        set {
            categoryTitle = newValue
        }
    }
    
    init(post:Int, title:String) {
        self.postId = post
        self.categoryTitle = title
    }
    
    
    
}
