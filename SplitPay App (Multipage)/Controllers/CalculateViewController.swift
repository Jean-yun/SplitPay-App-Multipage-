//
//  ViewController.swift
//  SplitPay App (Multipage)
//
//  Created by 윤진영 on 7/3/24.
//

import UIKit

class CalculateViewController: UIViewController {
    
    //1.Create var
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var billPerPerson = "0.0"
    
    //2.Create button actions
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        //remove the % sign
        let buttonTitle = sender.currentTitle!
        let buttonNoPct = String(buttonTitle.dropLast())
        let buttonAsNumber = Double(buttonNoPct)!
        tip = buttonAsNumber/100
        print(tip)
        
        //remove the keyboard
        billTextField.endEditing(true)
    }
    
    //3.Create button for stepper (When clicked, it returns float 1.0, 2.0 ...)
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        //bring the entered value. We're gonna calcuate the total bil per person
        
        //1) Amount of bill entered
        let bill = billTextField.text!
        billTotal = Double(bill)!
        
        //2) Amount of tip & people (match the data type)
        let result = (billTotal * (1+tip)) / Double(numberOfPeople)
        
        //3) Return the String of the result (This is the amount to show in the Result Pag!!e)
        billPerPerson = String(format: "%.2f", result)
        
        
        //4) NOW, LINK to the second page
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    //4. Link variables to the Second Page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = billPerPerson
            destinationVC.tip = Int(tip*100)
            destinationVC.split = numberOfPeople
        }
        //ref. variables in the Second Page
        //var result = "0.0"
        //var tip = 0
        //var split = 0
    }
}

