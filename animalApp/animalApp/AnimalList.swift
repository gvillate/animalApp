//
//  AnimalList.swift
//  animalApp
//
//  Created by Alexandra Plukis on 2/16/20.
//  Copyright © 2020 Gabriela Villate. All rights reserved.
//

import Foundation

class AnimalList {
    var currentAnimal: Int = 0
    var numberOfAnimals: Int = 0
    var list: [(name: String, animal: Animal)] = [(String, Animal)]()
    
    func add(_ newAnimal: Animal) {
        list.append((newAnimal.getName(), newAnimal))
        numberOfAnimals += 1 
    }
    
    func delete() {
        list.remove(at: currentAnimal)
        numberOfAnimals -= 1
    }
    
    func getNext() -> Animal? {
        if (currentAnimal >= numberOfAnimals - 1) {
            return nil
        }
        else {
            currentAnimal += 1
            return list[currentAnimal].animal
        }
    }
    
    func getPrevious() -> Animal? {
        if (currentAnimal <= 0) {
            return nil
        }
        else {
            currentAnimal -= 1
            return list[currentAnimal].animal
        }
    }
    
    func search(name toFind: String) -> Animal? {
        for i in list.indices {
            if (list[i].name == toFind) {
                currentAnimal = i
                return list[i].animal
            }
        }
        return nil //didn't find it
    }
    
    func printAnimals() {
        for item in list {
            print("\(item.name.uppercased()):")
            print("diet: \(item.animal.getDiet())")
            print("legs: \(item.animal.getLegs())")
            print("sound: \(item.animal.getSound())")
        }
    }
}
