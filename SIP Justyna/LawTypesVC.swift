//
//  LawTypesVC.swift
//  SIP Justyna
//
//  Created by Radosław Stelmasiak on 14.01.2017.
//  Copyright © 2017 Radoslaw Stelmasiak. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LawTypesVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var lawTypesTV: UITableView!
    
    var lawTypes = [LawTypes]()
    
    typealias JsonObjStringAny = [String:AnyObject]
    
    let urlString = "http://json.j.pl/api/get_category_index/?parent=34"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JsonDataGet(url: urlString)
        

        lawTypesTV.delegate = self
        lawTypesTV.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DzialyCell", for: indexPath) as? LawTypesCell {
            
            let lawType = lawTypes[indexPath.row]
            
            cell.cellDzialyLabel.text = lawType.CategoryTitle
            
            return cell
            
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lawTypes.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let law:LawTypes = lawTypes[indexPath.row]
        
        performSegue(withIdentifier: "DzialSegue", sender: law)
        
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
        let dicJ = json["categories"].arrayValue
        for item in 0..<dicJ.count{
            if let object1 = dicJ[item].dictionary{
                let title = object1["title"]?.stringValue
                let id = object1["id"]?.intValue
                if let lawT:LawTypes = LawTypes.init(post: id!, title: title!){
                
                    lawTypes.append(lawT)
                
                }
            }
            lawTypesTV.reloadData()
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BillsVC{
            
            if let lawT = sender as? LawTypes{
                destination.LawTypeObj = lawT
            }
        }
    }
}



