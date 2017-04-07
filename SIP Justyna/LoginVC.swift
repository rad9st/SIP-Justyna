////
////  ViewController.swift
////  SIP Justyna
////
////  Created by Radosław Stelmasiak on 10.01.2017.
////  Copyright © 2017 Radoslaw Stelmasiak. All rights reserved.
////
//
//import UIKit
//import Firebase
//
//class LoginVC: UIViewController {
//    
//    @IBOutlet weak var emailTF: UITextField!
//    
//    @IBOutlet weak var passwordTF: UITextField!
//    
//    
//
//    @IBOutlet weak var logBtn: UIButton!
//    
//    private var segueDo = false
//    
//    var SegueDo: Bool {
//        get {
//            return segueDo
//        }
//        set {
//            segueDo = newValue
//        }
//    }
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//    }
//    
//    // obsługa loggowania do Firebase
//    
//    @IBAction func logBtnPress(_ sender: Any) {
//        FIRAuth.auth()?.signIn(withEmail: emailTF.text!, password: passwordTF.text!, completion: {
//        (user, error) in
//            
//            if error != nil{
//                self.showError(error: error!.localizedDescription)
//            }else{
//                print("Zalogowano")
//                self.SegueDo = true
//                self.loggedSegue(segueD: self.SegueDo)
//            }
//        
//        })
//        
//        
//    }
//    @IBAction func RegBtnPress(_ sender: Any) {
//        
//        performSegue(withIdentifier: "registration", sender: self)
//    }
//    
//    func loggedSegue(segueD: Bool){
//        if segueD==true{
//            performSegue(withIdentifier: "LoggedIn", sender: self)
//        }
//    }
//    
//    
//    func showError(error:String){
//        let errorPopUp = UIAlertController(title: "Wystąpił błąd", message: error, preferredStyle: UIAlertControllerStyle.alert)
//        
//        errorPopUp.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in self.navigationController?.popToRootViewController(animated: true)}))
//        present(errorPopUp, animated: true, completion: nil)
//        
//    }
//    
//
//  
//
//
//}
//
