//
//  ViewController.swift
//  Segues
//
//  Created by Michael Kozub on 2/9/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CanRecieve {
    
    var dataPassedBack = ""

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textLabel.text = dataPassedBack
    }

    
    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToSecondScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondScreen" {
            
            //allows us to tap into the properties of the SecondViewController
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.textPassedOver = textField.text!
            destinationVC.delegate = self //the destination delegate equals the first view controller
        }
    }
    
    func dataReceived(data: String) {
        textLabel.text = data
    }

}

