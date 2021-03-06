//
//  BillVC.swift
//  SIP Justyna
//
//  Created by Radosław Stelmasiak on 14.01.2017.
//  Copyright © 2017 Radoslaw Stelmasiak. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BillVC: UIViewController {

    private var billsLet: Bill!
    
    
    var BillsLet: Bill {
        get {
            return billsLet
        }
        set {
            billsLet = newValue
        }
    }
    
    private var urlBills:String!
    
    var UrlBills: String {
        get {
            return urlBills
        }
        set {
            urlBills = "http://json.j.pl/wp-json/wp/v2/posts/\(newValue)?fields=content.rendered"
        }
    }

    @IBOutlet weak var textViewBill: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UrlBills = BillsLet.Bill.description
        
        JsonDataGet(url: UrlBills)
        
        
    }
    
    func JsonDataGet(url: String){
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            
            if response.data != nil{
            
            self.parseData(JSONData: response.data!)
        }
            else{
                let error:String = "Nie można pobrać danych, proszę sprawdzić połoczenie z internetem"
                self.showError(error: error)
            }
        }
        )
    }
    
    func parseData(JSONData : Data) {
        let json = JSON(data: JSONData)
        for item in json["content"].dictionaryValue{
            let textA = item.value.description
           let textB = stringFromHtml(string: textA)
            textViewBill.attributedText = textB
            
            textViewBill.font = UIFont(name: "didot", size: 18)
        
            
        }
        
    }
    
    // przetwarzanie tekstu html do wyświetlenia w textview - processing text html format to show on textview
    private func stringFromHtml(string: String) -> NSAttributedString? {
        do {
            let string = string.data(using: String.Encoding.utf16, allowLossyConversion: true)
            if let dataString = string {
                let text = try NSAttributedString(data: dataString,
                                                 options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                                                 documentAttributes: nil)

                return text
            }
        } catch {
        }
        return nil
    }
    
    func showError(error:String){
        let errorPopUp = UIAlertController(title: "Wystąpił błąd", message: error, preferredStyle: UIAlertControllerStyle.alert)
        
        errorPopUp.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in self.navigationController?.popToRootViewController(animated: true)}))
        present(errorPopUp, animated: true, completion: nil)
        
    }
    
    
}
