//
//  CostUITabBarItem.swift
//  swift_project
//
//  Created by ANTOINE SANCHEZ on 01/04/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import UIKit

class CostUITabBarItem: UITabBarItem {

    convenience override init(){
        self.init()
        self.image = UIImage(named: "img")
        self.title = "cost"
        self.tag = 1
    }
}
