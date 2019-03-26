//
//  TripSet.swift
//  swift_project
//
//  Created by DIEGO KRZYZANOWSKI on 26/03/2019.
//  Copyright © 2019 REGNART-SANCHEZ. All rights reserved.
//

import Foundation

class TripSet: Sequence {
    
    var tripList : [Trip]
    
    init(){
        self.tripList = []
    }
    
    init(trips : [Trip]){
        self.tripList = trips
    }
    
    var isEmpty : Bool {
        return self.tripList.isEmpty
    }
    
    func add(trip : Trip){
        if self.contains(trip : trip){
            return
        } else {
            tripList.append(trip)
        }
    }
    
    func remove(trip : Trip){
        guard let index = self.indexOf(trip: trip) else {
            return
        }
        tripList.remove(at: index)
    }
    
    var count : Int {
        return self.tripList.count
    }
    
    func indexOf(trip : Trip) -> Int? {
        var i : Int? = nil
        for index in 0..<tripList.count {
            if tripList[index].name == trip.name {
                i = index
            }
        }
        return i
    }
    
    func contains(trip : Trip)-> Bool {
        var cont : Bool = false
        for t in tripList {
            if t.name==trip.name {
                cont = true
            }
        }
        return cont
    }
    
    func look(trip: Trip) -> Trip? {
        guard let index = indexOf(trip: trip) else{
            return nil
        }
        return tripList[index]
    }
    
    
    func look(name: String) -> [Trip]{
        var trips : [Trip] = []
        for t in self.tripList {
            if t.name == name {
                trips.append(t)
            }
        }
        return trips
    }
    
    func makeIterator() -> ItTripSet{
        let iterator: ItTripSet = ItTripSet(trips: self)
        return iterator
    }
    
    
    
}
