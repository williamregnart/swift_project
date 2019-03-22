//
//  PersonSetViewModel.swift
//  swift_project
//
//  Created by Antoine SANCHEZ on 22/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation
import UIKit

protocol PersonSetViewModelDelegate {
    
}

class PersonSetViewModel {
    
    private let modelSet : PersonSet
    var dataset : [Person] = []
    var delegate : PersonSetViewModelDelegate? = nil
    
    init() {
        guard let appDelegate = UIApplication.shared.delegate  else{
            fatalError()
        }
        
        for p in self.modelSet{
            self.dataset.append(p)
        }
    }
    
    convenience init(delegate : PersonSetViewModelDelegate) {
        self.init()
        self.delegate = delegate
    }
}
