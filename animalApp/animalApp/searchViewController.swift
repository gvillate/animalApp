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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
