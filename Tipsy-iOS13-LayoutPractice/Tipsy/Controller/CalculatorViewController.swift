//
//  CalculateViewController.swift
//  Tipsy
//
//  Created by  Vladyslav Fil on 27.04.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var splitNumber = 2.0
    var result = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        if var title = sender.currentTitle {
            title.removeLast()
            tip = Double(title)! / 100.0
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber = sender.value
        splitNumberLabel.text = String(Int(splitNumber))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != "" {
            let billTotal = Double(bill.replacingOccurrences(of: ",", with: "."))!
            let total = billTotal * (1 + tip) / Double(splitNumber)
            result = String(format: "%.2f", total)
        }
        self.performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.total = result
            destinationVC.numberOfPeople = Int(splitNumber)
            destinationVC.tip = Int(tip * 100)
        }
    }

}
