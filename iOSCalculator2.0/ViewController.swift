//
//  ViewController.swift
//  iOSCalculator2.0
//
//  Created by Stanislav Sobolevsky on 16.08.22.
//

import UIKit

class ViewController: UIViewController {
    var workings:String = ""
    
    @IBOutlet var labelResult: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // clearAll("0")
    }
    
    @IBAction func clearAll(_ sender: Any) {
        
        workings = ""
        labelResult.text = "0"
    }
    
    func addToWorkings(value: String)
    {
        workings = workings + value
        labelResult.text = workings
    }
    
    
    @IBAction func plusOrMinusTap(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    
    @IBAction func prosentTap(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    
    @IBAction func divideTap(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    
    @IBAction func timesTap(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    @IBAction func minusTap(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    
    @IBAction func plusTap(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    
    @IBAction func resultTap(_ sender: Any) {
        if(validInput())
        {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            labelResult.text = resultString
        }
        else
        {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _ in
                self.workings.removeLast()
                self.labelResult.text = self.workings}))
            self.present(alert, animated: true, completion: nil)
        
            
           // self.present(alert, animated: true, completion: nil)
            
        }
        //addToWorkings(value: "=")
    }
    
    func validInput() ->Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            
            if(index == workings.count - 1)
            {
                return false
            }
            
            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    
    @IBAction func declimalTap(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    
    @IBAction func zeroTap(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    
    @IBAction func oneTap(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    
    @IBAction func twoTap(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    
    @IBAction func treeTap(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    
    @IBAction func fourTap(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    
    @IBAction func fifeTap(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    
    @IBAction func sixTap(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func nineTap(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
}

