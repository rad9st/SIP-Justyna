//
//  RegUsersVC.swift
//  SIP Justyna
//
//  Created by Radosław Stelmasiak on 12.01.2017.
//  Copyright © 2017 Radoslaw Stelmasiak. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegUsersVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var rePasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    @IBAction func returnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func RegBtnPressed(_ sender: Any) {
        
        
        if passwordTF.text == rePasswordTF.text{
            FIRAuth.auth()?.createUser(withEmail: emailTF.text!, password: passwordTF.text!, completion: {
            (user, error) in
                
                if error != nil {
                    print(error!.localizedDescription)
                }
                else{
                    print("User created")
                    self.dismiss(animated: true, completion: nil)
                }
            
            
            })
        }
        
        
    }
    

    

}
