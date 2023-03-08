//
//  ViewController.swift
//  FU-LIVE-Exercise
//
//  Created by Antonio on 2023-03-07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var num: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var tipInput: UITextField!
    @IBOutlet weak var result: UILabel!
    var guestValue = 0
    var tip = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        num.text = "0"
        stepper.value = 0
        stepper.minimumValue = 1.0
        stepper.maximumValue = 100.0
        stepper.stepValue = 1
        
    }
    
    func calculateTip(guestValue : Int, tipProcentage : Int) -> Double {
        let subtotal = Double(guestValue) * 10.0
        let tip = subtotal * Double(tipProcentage) / 100.0
        let total = subtotal + tip
        return total
    }
    
    @IBAction func stepperHandler(_ sender: UIStepper) {
        guestValue = Int(sender.value)
        num.text = "\(guestValue)"
    }
    
    @IBAction func tipInput(_ sender: Any) {
        if let tipText = tipInput.text, let tipValue = Int(tipText) {
            tip = tipValue
        }
        tipInput.text = String(tip)
    }
    
    @IBAction func buttonPressedCalculate(_ sender: Any) {
        let total = calculateTip(guestValue: guestValue, tipProcentage: tip)
        result.text = String(total)
    }
    
}


