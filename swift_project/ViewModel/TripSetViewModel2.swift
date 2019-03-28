//
//  TripSetViewModel2.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 28/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class TripSetViewModel2{
    
    var tripSet:[TripViewModel] = []
    
    init(tripSet: TripSet){
        for trip in tripSet.tripList{
            self.tripSet.append(TripViewModel(trip: trip))
        }
    }
    
    func getTripByIndex(index: Int?) -> TripViewModel?{
        if let i = index {
            if i>=0 && i<self.tripSet.count {
                return self.tripSet[i]
            }
        }
        return nil
    }
    
    func getIndexByTrip(trip: TripViewModel) -> Int?{
        var indexPath = -1
        for index in 0...tripSet.count{
            if trip == self.tripSet[index]{
                indexPath = index
            }
        }
        if(indexPath == -1){
            return nil
        }
        return indexPath
    }
    
}
