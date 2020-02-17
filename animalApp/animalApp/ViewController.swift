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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func add(_ sender: Any) {
        if let name = nameField.text, let sound = soundField.text {
            
        }
    }
    


}

