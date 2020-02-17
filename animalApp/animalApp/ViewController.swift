//
//  ViewController.swift
//  animalApp
//
//  Created by Gabriela Villate on 2/16/20.
//  Copyright © 2020 Gabriela Villate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var animalList: AnimalList = AnimalList()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dietControl: UISegmentedControl!
    @IBOutlet weak var soundField: UITextField!
    @IBOutlet weak var legStepper: UIStepper!
    @IBOutlet weak var legLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func add(_ sender: Any) {
        if let name = nameField.text, let sound = soundField.text, let legs = Int(legLabel.text!) {
            let diet = getDiet()
            animalList.add(Animal(name: name, diet: diet, legs: legs, sound: sound))
            clearFields()
        }
        animalList.printAnimals()
    }
    
    @IBAction func updateLegs(_ sender: Any) {
        legLabel.text = "\(Int(legStepper.value))"
    }
    
    func clearFields() {
        nameField.text = ""
        soundField.text = ""
        legLabel.text = "0"
        dietControl.selectedSegmentIndex = 0
    }
    
    func getDiet() -> Diet {
        var diet: Diet
        let dietChoice: Int = dietControl.selectedSegmentIndex
        if (dietChoice == 0) {
            diet = Diet.OMNIVORE
        }
        else if (dietChoice == 1) {
            diet = Diet.CARNIVORE
        }
        else {
            diet = Diet.HERBIVORE
        }
        return diet
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? searchViewController {
            destination.animalList = self.animalList
        }
    }

}

