//
//  searchViewController.swift
//  animalApp
//
//  Created by Gabriela Villate on 2/16/20.
//  Copyright © 2020 Gabriela Villate. All rights reserved.
//

import UIKit

class searchViewController: UIViewController {
    var animalList = AnimalList()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dietControl: UISegmentedControl!
    @IBOutlet weak var soundField: UITextField!
    @IBOutlet weak var legField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        disableFields()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchAnimal(_ sender: Any) {
        let searchAlert = UIAlertController(title: "Search for Animal", message: "", preferredStyle: .alert)
        
        let dataInputAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            let textField = searchAlert.textFields![0] as UITextField
            
            if let animal = textField.text{
                print(animal)
                if let foundAnimal = self.animalList.search(name: animal) {
                    self.nameField.text = foundAnimal.getName()
                    self.dietControl.selectedSegmentIndex = foundAnimal.getDietIndex()
                    self.soundField.text = foundAnimal.getSound()
                    self.legField.text = "\(foundAnimal.getLegs())"
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
            
        }
        searchAlert.addTextField { (textField) in
            textField.placeholder = "animal name"
        }
        
        searchAlert.addAction(dataInputAction)
        searchAlert.addAction(cancelAction)
        
        self.present(searchAlert, animated: true, completion: nil)
    }
    
    @IBAction func getPrevious(_ sender: Any) {
        if let previousAnimal = self.animalList.getPrevious() {
            self.nameField.text = previousAnimal.getName()
            self.dietControl.selectedSegmentIndex = previousAnimal.getDietIndex()
            self.soundField.text = previousAnimal.getSound()
            self.legField.text = "\(previousAnimal.getLegs())"
        }
    }
    
    @IBAction func getNext(_ sender: Any) {
        if let nextAnimal = self.animalList.getNext() {
            self.nameField.text = nextAnimal.getName()
            self.dietControl.selectedSegmentIndex = nextAnimal.getDietIndex()
            self.soundField.text = nextAnimal.getSound()
            self.legField.text = "\(nextAnimal.getLegs())"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController {
            destination.animalList = self.animalList
        }
    }
    
    func disableFields() {
        nameField.allowsEditingTextAttributes = false
        soundField.allowsEditingTextAttributes = false
        legField.allowsEditingTextAttributes = false
        dietControl.isEnabled = false
    }

}
