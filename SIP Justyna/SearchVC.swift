//
//  SearchVC.swift
//  SIP Justyna
//
//  Created by Radosław Stelmasiak on 21.01.2017.
//  Copyright © 2017 Radoslaw Stelmasiak. All rights reserved.
//

import UIKit


class SearchVC: UIViewController {
    
    
    @IBOutlet weak var SearchField: UITextField!
    
    var userSearchText: String!;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func SearchAction(_ sender: Any) {
        
        userSearchText = SearchField.text
        
        if userSearchText != nil{
            performSegue(withIdentifier: "SearchResults", sender: userSearchText)
        }
        else{
            print("pole nie może być puste")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ResultsVC{
            if (sender as? String) != nil{
                destination.UrlResults = userSearchText
            }
        }
    }
    

}
