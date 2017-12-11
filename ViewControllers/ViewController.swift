//
//  ViewController.swift
//  LifeStyles01
//
//  Created by Jake Berberich on 12/2/17.
//  Copyright © 2017 Jake Berberich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var favoriteCategory: UITextField!
    @IBOutlet weak var favoriteMetric: UITextField!
    
    @IBOutlet weak var sleepValueLabel: UILabel!
    @IBOutlet weak var cardioValueLabel: UILabel!    
    @IBOutlet weak var liftValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var dietValueLabel: UILabel!
    @IBOutlet weak var wineValueLabel: UILabel!
   
    
    
    @IBOutlet weak var sleepValue: UITextField!
    @IBOutlet weak var cardioValue: UITextField!
    @IBOutlet weak var lifttValue: UITextField!
    @IBOutlet weak var weightValue: UITextField!
    @IBOutlet weak var dietValue: UITextField!
    @IBOutlet weak var wineValue: UITextField!
 
   
    @IBOutlet var metricSegueButton: UIView!
    
    @IBOutlet weak var receivedDate: UITextField!
    @IBOutlet weak var receivedMetric: UITextField!
    
    var jakeMetric = " this is from jake"
    var score: Int = 0
    var selectedCategory: String?
    var selectedMetric: String?
    var currentCategory: Int?
    var  metric = ["Great",
                   "Fair",
                   "Poor"]
    
    let category = ["Sleep",
                    "Cardio",
                    "Lifting",
                    "Wine",
                    "Cigars",
                    "Study",
                    "Weight"]
    
    let sleeperValues: [String : Int] = ["Great": 10,
                                        "Fair" : 8,
                                        "Poor" : 5]
    let sleeper = ["Great",
                   "Fair",
                   "Poor"
    ]
    let cardioValues: [String : Int] = ["No": 0,
                                  "Walk" : 10,
                                  "Bike" : 8
    ]
    let cardio = ["No",
                  "Walk",
                  "Bike"]
    
    let lift = [ "No",
                 "Great",
                 "Good",
                 "Fair",
                 "Poor"]
    
    let liftValues: [String: Int] = [ "No": 0,
                                     "Great" : 10,
                                     "Good": 8 ,
                                     "Fair": 6,
                                     "Poor":4]
    
    let weight = ["Even",
                  "Up",
                  "Down"]
    let weightValues: [String : Int] = ["Even": 8,
                                        "Up" : 0,
                                        "Down" : 10]
    
    let diet = ["Health",
                "OverAte"]
    
    let dietValues: [String: Int] = ["Healthy": 10,
                                     "OverAte" : 0]
    
    let wine = ["Moderate",
                "Over Served"]
   
    let wineValues : [String: Int] = ["Moderate": 10,
                                      "Over Served" : 0]
    
    
//    let cigar = ["None",
//                  "Yes"]
//
//    let cigarValues: [String: Int] = ["None": 10,
//                                      "Yes": 0]
//
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteMetric.text = "inz"
        createMetricsPicker()
        createToolbar()
        currentCategory = 0
   
    }
    
    @IBAction func selectedCategory(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            metric =  sleeper
            currentCategory = 0
        case 1:
            metric = cardio
            currentCategory = 1
        case 2:
            metric = lift
            currentCategory = 2
        case 3:
            metric = weight
            currentCategory = 3
        case 4:
            metric = diet
            currentCategory = 4
        case 5:
            metric = wine
            currentCategory = 5
//        case 6:
//            metric = cigar
//            currentCategory = 6
        default:
            metric = sleeper
        }
            
    }
    
    func createMetricsPicker() {
        let metricPicker = UIPickerView()
        metricPicker.delegate = self
        favoriteMetric.inputView = metricPicker
    }
    
    
    
    func createToolbar() {
    let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain,   target: self, action: #selector(ViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton],  animated: false)
       favoriteMetric.inputAccessoryView = toolBar

       
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
  //-----------------------------------------------------------------
     
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "metricSegue" {
            guard  let metricVC = segue.destination as? MetricVC else {return}
            metricVC.metricString = receivedMetric.text
        }
    }
    
    @IBAction func didUnwindFromMetricVC (_ sender: UIStoryboardSegue) {
        guard let metricVC = sender.source as? MetricVC else {return}
        receivedMetric.text = metricVC.sendBackToSegue
        
    }
    
    @IBAction func didUnwindFrommDateVC (_ sender: UIStoryboardSegue) {
        guard let datePickerVC = sender.source as? DatePickerVC else {return}
        receivedMetric.text = datePickerVC.dateToReurn
        
    }
// -----------------------------------------------------------------------
}
        extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
            
            func numberOfComponents(in pickerView: UIPickerView) -> Int {
                return 1
            }
            
            func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
            {return metric.count}
            
            func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                return metric[row]
            }
            
            func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                selectedMetric = metric[row]
                favoriteMetric.text = selectedMetric
      
                if currentCategory == 0 {
                    sleepValueLabel.text = selectedMetric
                    let score: Int! =  sleeperValues[selectedMetric!]
                    sleepValue.text = String(score)                }
                
                if currentCategory == 1 {
                    cardioValueLabel.text  = selectedMetric
                    let score: Int! =  cardioValues[selectedMetric!]
                    cardioValue.text = String(score)
                }
                
                if currentCategory == 2 {
                    liftValueLabel.text = selectedMetric
                    let score: Int! =  liftValues[selectedMetric!]
                   lifttValue.text = String(score)
                }
                
                if currentCategory == 3  {
                    weightValueLabel.text  = selectedMetric
                    let score: Int! =  weightValues[selectedMetric!]
                    weightValue.text = String(score)                }
                
                if currentCategory == 4 {
                    dietValueLabel.text = selectedMetric
                    let score: Int! =  dietValues[selectedMetric!]
                    dietValue.text = String(score)
                }
                
                if currentCategory == 5 {
                    wineValueLabel.text  = selectedMetric
                    let score: Int! =  wineValues[selectedMetric!]
                    wineValue.text = String(score)
                }
                
//                if currentCategory == 6 {
//                    cigarValueLabel.text = selectedMetric
//                    let score: Int! = cigarValues[selectedMetric!]
//                    cigarValue.text = String(score)
//                }
                
                  }
            
            } // end of entension




