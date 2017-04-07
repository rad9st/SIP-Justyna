//
//  LegalInfoVC.swift
//  SIP Justyna
//
//  Created by Radosław Stelmasiak on 01.04.2017.
//  Copyright © 2017 Radoslaw Stelmasiak. All rights reserved.
//

import UIKit

class LegalInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func backToMenu(_ sender: Any) {
        performSegue(withIdentifier: "legalBack", sender: nil)
    }
    

    

}
