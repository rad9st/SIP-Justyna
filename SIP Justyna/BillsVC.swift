//
//  BillsVC.swift
//  SIP Justyna
//
//  Created by Radosław Stelmasiak on 17.01.2017.
//  Copyright © 2017 Radoslaw Stelmasiak. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BillsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var BillsTV: UITableView!
    
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
            urlBills = "http://json.j.pl/wp-json/wp/v2/posts?categories=\(newValue)&&fields=id,title.rendered"
        }
    }
    
    
    //tablica obiektów Bill
    var billsArrayTV = [Bill]()
    
    // ładowanie widoku

    override func viewDidLoad() {
        super.viewDidLoad()
        UrlBills = LawTypeObj.PostId.description
        
        JsonDataGet(url: UrlBills)
        
        BillsTV.delegate = self
        BillsTV.dataSource = self
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BillCell", for: indexPath) as? BillCell {
            
            let billType = billsArrayTV[indexPath.row]
            
            cell.BillsLabel.text = billType.BillTitle
            
            return cell
            
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return billsArrayTV.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let bill:Bill = billsArrayTV[indexPath.row]
        
        performSegue(withIdentifier: "BillSegue", sender: bill)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BillVC{
            
            if let bill = sender as? Bill{
                destination.BillsLet = bill
            }
        }
    }

    
    func JsonDataGet(url: String){
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            self.parseData(JSONData: response.data!)
            
        }
            
        )
    }
    
    func parseData(JSONData : Data) {
        
        
        
        let json = JSON(data: JSONData)
        print(json)
        for item in 0..<json.count{
            if let object1 = json[item].dictionary{
                
                let id = object1["id"]?.intValue
                
                if let title1 = object1["title"]?.dictionary{
                    let title2 = title1["rendered"]?.stringValue
                    if let billTemp:Bill = Bill.init(bill: id!, billTitle: title2!){
                        
                        billsArrayTV.append(billTemp)
                    }
                }
            }
            BillsTV.reloadData()
        }
        
        
    }

}
    

    

