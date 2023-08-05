//
//  ViewController.swift
//  Calculator
//
//  Created by Muhammet Emin Ayhan on 3.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen : Double = 0
    var previousNumber : Double = 0
    var performingMath = false
    var operation = 0
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true
        {
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            performingMath = true
        }
        else
        {
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
        }
        
       
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 18
        {
            previousNumber = Double(label.text!)!
            
            if sender.tag == 14{
                label.text = "/"
            }
            else if sender.tag == 15{
                label.text = "*"
            }
            else if sender.tag == 16{
                label.text = "-"
            }
            else if sender.tag == 17{
                label.text = "+"
            }
            
            
            performingMath = true
            operation = sender.tag
        }
        else if sender.tag == 18
        {
            if operation == 14{
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 15{
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 16{
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 17{
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11{
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
        
    }
}

