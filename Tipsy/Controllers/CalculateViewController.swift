//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var tip: Float = 0.0
    var numberOfPeopleToSplit: Int = 2
    var numberOfPeopleToSplitValue = "2"
    var tipPercentage: Float = 0.1
    var tipPercentageValue : String = "10"
    var amountToPayPerPerson: Float = 0.0
    var amountToPayPerPersonValue = "0.0"
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        if (sender.titleLabel?.text == "0%" ) {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tip = 0
        } else if (sender.titleLabel?.text == "10%"){
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tip = 10
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tip = 20
        }
        
        tipPercentage = tip / 100
        print(String(format: "%.1f", tipPercentage))
        
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeopleToSplit = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let amountToPay = Float(billTextField.text!)
               
        if (amountToPay != nil ) {
            let totalAmountToPay = (amountToPay! * tipPercentage) + amountToPay!
                               
            amountToPayPerPerson  = totalAmountToPay / Float(numberOfPeopleToSplit)
            amountToPayPerPersonValue = String(format: "%.2f", amountToPayPerPerson)
            numberOfPeopleToSplitValue = String(numberOfPeopleToSplit)
        
            tipPercentageValue = String(format: "%.0f", (tipPercentage * 100))
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.amountToPayPerPersonValue = amountToPayPerPersonValue
            destinationVC.numberOfPeopleToSplitValue = numberOfPeopleToSplitValue
            destinationVC.tipPercentageValue = tipPercentageValue
            
        }
        
    }
  

}

