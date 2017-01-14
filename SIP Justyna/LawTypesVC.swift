//
//  LawTypesVC.swift
//  SIP Justyna
//
//  Created by Radosław Stelmasiak on 14.01.2017.
//  Copyright © 2017 Radoslaw Stelmasiak. All rights reserved.
//

import UIKit

class LawTypesVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var lawTypesTV: UITableView!
    
    var lawTypes = [LawTypes]()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parsingJsonLawTypes()

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
        
        let partyRock = lawTypes[indexPath.row]
        
        performSegue(withIdentifier: "DzialySegue", sender: partyRock)
        
    }
    
    func parsingJsonLawTypes() {
        
        let urlString = "http://json.j.pl/api/get_category_index/?parent=34"
        let url = URL(string: urlString)
        
        
        DispatchQueue.global().async {
            do {
                URLSession.shared.dataTask(with:url!) { (data, response, error) in
                    if error != nil {
                    } else {
                        do {
                            let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                            let lawTypesJason = parsedData["categories"] as! [String:Any]
                            
                            print(lawTypesJason)
                            
                            
                        } catch let error as NSError {
                            print(error)
                        }
                    }
                    
                    }.resume()
                
                
                
                
                DispatchQueue.global().sync {
                    
                }
            } catch  {
                //handle the error
            }
        }
        
    }
    
    

    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if let destination = segue.destination as? BillListVC {
//            
//            if let send = sender as? LawTypes {
//                
//            }
//            
//        }
//        
//    }
    
    
}


    


