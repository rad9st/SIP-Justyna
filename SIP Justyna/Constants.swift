//
//  Constants.swift
//  SIP Justyna
//
//  Created by Radosław Stelmasiak on 01.04.2017.
//  Copyright © 2017 Radoslaw Stelmasiak. All rights reserved.
//

import Foundation
import UIKit

func UIAlertCreationNoInternet() -> UIAlertController{
        let alert = UIAlertController(title: "Błąd", message: "Proszę sprawdzić połączenie z internetem.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        return alert
}
