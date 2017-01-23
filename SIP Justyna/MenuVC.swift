//
//  MenuVC.swift
//  SIP Justyna
//
//  Created by Radosław Stelmasiak on 21.01.2017.
//  Copyright © 2017 Radoslaw Stelmasiak. All rights reserved.
//

import UIKit
import FirebaseAuth

class MenuVC: UIViewController {

    //var url = "http://json.j.pl/wp-json/wp/v2/posts?search=post%C4%99powanie,karne,kodeks,oskar%C5%BCenia&&fields=id,title.rendered"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func BillsListPressed(_ sender: Any) {
        performSegue(withIdentifier: "TagsList", sender: nil)
    }
    
    @IBAction func SearchPressedBtn(_ sender: Any) {
        performSegue(withIdentifier: "SearchMenu", sender: nil)
    }
    
    @IBAction func LogoutPressed(_ sender: Any) {
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        performSegue(withIdentifier: "LogoutSegue", sender: nil)
    }

    
    }
