//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Harting, R.P.G. (Rob) on 09/08/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var amountToPayPerPersonValue: String?
    var numberOfPeopleToSplitValue: String?
    var tipPercentageValue: String?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(amountToPayPerPersonValue!)

        totalLabel.text = amountToPayPerPersonValue
        settingsLabel.text = "Split between \(numberOfPeopleToSplitValue!) people, with \(tipPercentageValue!)% tip."
    }

   
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
