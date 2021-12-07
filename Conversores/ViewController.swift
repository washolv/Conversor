//
//  ViewController.swift
//  Conversores
//
//  Created by Francisco Washington de Almeida Oliveira on 06/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbUnit: UILabel!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var btUnit1: UIButton!
    
    @IBOutlet weak var tfResult: UILabel!
    @IBOutlet weak var lbresult: UITextField!
    @IBOutlet weak var tfvalue: UITextField!
    
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var lbUnitResult: UILabel!
    @IBOutlet weak var lbResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
            case "Temperatura":
                lbUnit.text!="Peso";
                btUnit1.setTitle("Kilograma", for: .normal)
                btUnit2.setTitle("Libra", for: .normal)
            case "Peso":
                lbUnit.text!="Moeda";
                btUnit1.setTitle("Dólar", for: .normal)
                btUnit2.setTitle("Real", for: .normal)
            case "Moeda":
                lbUnit.text!="Distância";
                btUnit1.setTitle("Metros", for: .normal)
                btUnit2.setTitle("Kilômetro", for: .normal)
            default:
                lbUnit.text!="Temperatura";
                btUnit1.setTitle("Celsius", for: .normal)
                btUnit2.setTitle("Farenheint", for: .normal)
            }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha=0.5
            }else{
                btUnit1.alpha=0.5
            }
            sender.alpha=1.0
            
            switch lbUnit.text! {
                case "Temperatura":
                    calcTemperature()
                case "Peso":
                    calcWeight()
                case "Moeda":
                    calcCurrency()
                default:
                    calcDistance()
                }
            let result = Double(lbResult.text!)!
            lbResult.text! = String(format: "%.2f", result)
            view.endEditing(true);
        }
    }
    func calcTemperature(){
        guard let temperature = Double(tfValue.text!) else {return}
        if btUnit1.alpha==1.0{
            lbUnitResult.text! = "Farenheint"
            lbResult.text! = String(temperature * 1.8 + 32.0)
        }else{
            lbUnitResult.text! = "Celsius"
            lbResult.text! = String((temperature - 32.0)/1.8)
        }
    }
    func calcWeight(){
        guard let weight = Double(tfValue.text!) else {return}
        if btUnit1.alpha==1.0{
            lbUnitResult.text! = "Libra"
            lbResult.text! = String(weight/2.2046)
        }else{
            lbUnitResult.text! = "Kilograma"
            lbResult.text! = String(weight * 2.20)
        }
    }
    func calcCurrency(){
        guard let currency = Double(tfValue.text!) else {return}
        if btUnit1.alpha==1.0{
            lbUnitResult.text! = "Dólar"
            lbResult.text! = String(currency / 6.55)
        }else{
            lbUnitResult.text! = "Real"
            lbResult.text! = String(currency * 6.55)
        }
    }
    func calcDistance(){
        guard let distance = Double(tfValue.text!) else {return}
        if btUnit1.alpha==1.0{
            lbUnitResult.text! = "Kilômetro"
            lbResult.text! = String(distance/1000)
        }else{
            lbUnitResult.text! = "Metros"
            lbResult.text! = String(distance * 1000)
        }
    }
}

