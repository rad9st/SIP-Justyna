//
//  Bill.swift
//  SIP Justyna
//
//  Created by Radosław Stelmasiak on 17.01.2017.
//  Copyright © 2017 Radoslaw Stelmasiak. All rights reserved.
//

import Foundation

class Bill {
    
    private var bill:Int
    private var billTitle:String
    
    var Bill: Int {
        get {
            return bill
        }
        set {
            bill = newValue
        }
    }
    
    var BillTitle: String {
        get {
            return billTitle
        }
        set {
            billTitle = newValue
        }
    }
    
    init(bill:Int, billTitle:String) {
        self.bill = bill
        self.billTitle = billTitle
    }
    
    
    
    
    
    
}
