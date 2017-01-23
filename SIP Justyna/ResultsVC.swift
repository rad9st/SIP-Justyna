//
//  ResultsVC.swift
//  SIP Justyna
//
//  Created by Radosław Stelmasiak on 21.01.2017.
//  Copyright © 2017 Radoslaw Stelmasiak. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ResultsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var urlResults:String!
    
    
    
    @IBOutlet weak var ResultsTV: UITableView!
    
    var UrlResults: String {
        get {
            return urlResults
        }
        set {
            urlResults = "http://json.j.pl/wp-json/wp/v2/posts?search=%22\(newValue)%22&&fields=id,title.rendered"
        }
    }
    
    var reasultsArrayTV = [Bill]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = UrlResults
        print(url)
        JsonDataGet(url: url)
        
        
        ResultsTV.delegate = self
        ResultsTV.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchCell{
            
            let cellType = reasultsArrayTV[indexPath.row]
            
            cell.labelReasult.text = cellType.BillTitle
            
            return cell
            
        }
        else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reasultsArrayTV.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let resType = reasultsArrayTV[indexPath.row]
        
        performSegue(withIdentifier: "ReasultShow", sender: resType)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ShowResultsBillVC{
            
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
        for item in 0..<json.count{
            if let object1 = json[item].dictionary{
                let id = object1["id"]?.intValue
                if let title1 = object1["title"]?.dictionary{
                    let title2 = title1["rendered"]?.stringValue
                    if let billTemp:Bill = Bill.init(bill: id!, billTitle: title2!){
                        reasultsArrayTV.append(billTemp)
                    }
                }
            }
            ResultsTV.reloadData()
        }

    }
}
