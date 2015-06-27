//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Alex on 6/13/15.
//  Copyright (c) 2015 Alex Arze. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var name = ""
    var age = 0
    var breed = ""
    var image = UIImage(named: "")
    var subSpecies = ""
    
    func chuff() {
        println("\(name): Chuff Chuff")
    }
    
    func chuffNumberOfTimes(numberOfTimes:Int) {
        
        for (var i = 0; i < numberOfTimes; i++) {
            self.chuff()
        }
        
    }
    
    func ageInTigerYearsFromAge(regularAge:Int) -> Int {
        return regularAge * 3
    }
    
    func randomFact() -> String {
        let randomFactNumber = Int(arc4random_uniform(UInt32(3)))
        var randomFact:String
        
        switch randomFactNumber {
        case 0:
            randomFact = "Tigers are 10 feet tall."
        case 1:
            randomFact = "Tigers are amazing."
        case 2:
            randomFact = "Tigers have 10 feet."
        default:
            randomFact = ""
        }
        
        return randomFact
    }
}