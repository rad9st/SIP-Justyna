//
//  BillsVC.swift
//  SIP Justyna
//
//  Created by Radosław Stelmasiak on 17.01.2017.
//  Copyright © 2017 Radoslaw Stelmasiak. All rights reserved.
//

import UIKit

class BillsVC: UIViewController {
    
    
    private var lawTypeObj: LawTypes!
    
    var LawTypeObj: LawTypes {
        get {
            return lawTypeObj
        }
        set {
            lawTypeObj = newValue
        }
    }
    
    private var urlBills:String!
    
    var UrlBills: String {
        get {
            return urlBills
        }
        set {
            urlBills = "http://json.j.pl/api/get_category_index/?parent=\(newValue)"
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        UrlBills = LawTypeObj.PostId.description
        
        
    }

    

    
}
