//
//  ResultsVC.swift
//  SIP Justyna
//
//  Created by Radosław Stelmasiak on 21.01.2017.
//  Copyright © 2017 Radoslaw Stelmasiak. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {
    
    private var urlResults:String!
    
    var UrlResults: String {
        get {
            return urlResults
        }
        set {
            urlResults = "http://json.j.pl/wp-json/wp/v2/posts?search=\"\(newValue)\"&&fields=id,title.rendered"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    

}
