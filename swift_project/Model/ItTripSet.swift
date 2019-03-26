//
//  ItTripSet.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 26/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class ItTripSet : IteratorProtocol {
    
    typealias Element = Trip
    var iteratorIndex: Int = 0
    
    var trips = TripSet()
    
    init(trips:TripSet) {
        self.trips=trips
    }
    
    func next() -> Trip? {
        if self.iteratorIndex >= trips.count-1 {
            return nil
        }
            
        else {
            self.iteratorIndex += 1
        }
        
        return self.trips.tripList[iteratorIndex]
    }
    
    func reset(){
        self.iteratorIndex=0
    }
    
    var current:Trip?{
        if iteratorIndex>=trips.count{
            return nil
        }
        else{
            return self.trips.tripList[iteratorIndex]
        }
    }
    
    var end:Bool{
        return self.iteratorIndex>=trips.count
    }
    
    
}

