//
//  SecondViewController.swift
//  Segues
//
//  Created by Michael Kozub on 2/9/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit

protocol CanRecieve {
    func dataReceived(data : String)
}

class SecondViewController: UIViewController {
    
    var textPassedOver : String?
    
    var delegate : CanRecieve?
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var textLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textLabel2.text = textPassedOver
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendDataBack" {
            
            let firstVC = segue.destination as! ViewController
            firstVC.dataPassedBack = textField2.text!
        }
    }
    
    @IBAction func sendDataBack(_ sender: Any) {
        delegate?.dataReceived(data: textField2.text!)
        dismiss(animated: true, completion: nil)
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
