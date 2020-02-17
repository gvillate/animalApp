//
//  Animal.swift
//  animalApp
//
//  Created by Alexandra Plukis on 2/16/20.
//  Copyright © 2020 Gabriela Villate. All rights reserved.
//

import Foundation

enum Diet: Int {
    case OMNIVORE = 0, CARNIVORE = 1, HERBIVORE = 2
}

class Animal {
    var name: String
    var diet: Diet
    var legs: Int
    var sound: String
    
    init(name: String, diet: Diet, legs: Int, sound: String) {
        self.name = name
        self.diet = diet
        self.legs = legs
        self.sound = sound
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getDiet() -> Diet {
        return self.diet
    }
    
    func getLegs() -> Int {
        return self.legs
    }
    
    func getSound() -> String {
        return self.sound
    }
    
    func dance() -> String {
        //maintain whitespace
        return """
        ＼(^ω^＼)
        """ 
    }
}
