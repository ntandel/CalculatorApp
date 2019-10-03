//
//  ViewController.swift
//  Calculator App
//
//  Created by Nisha Tandel on 2019-09-25.
//  Copyright © 2019 Nisha Tandel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultlable: UILabel!
    
    var currentNumber: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var isPerformingOperation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultlable.text = ""
    }
    
    @IBAction func NumberPressed(_ sender: Any)
    {

        let tag = (sender as! UIButton).tag
        
        if isPerformingOperation == true
        {
            isPerformingOperation = false
            resultlable.text = String(tag-1)
            currentNumber = Double(resultlable.text!)!
        }
        else
        {
            resultlable.text = resultlable.text! + String(tag - 1)
            currentNumber = Double(resultlable.text!)!
        }
        
    }
    
    @IBAction func operatorPressed(_ sender: Any) {
        
        let tag = (sender as! UIButton).tag
        
        /* clear button - 16 */
        if tag == 16{
            resultlable.text = ""
            previousNumber = 0
            currentNumber = 0
            operation = 0
            
            return
        }
        
        /* operation ÷(11) ×(12) -(13) +(14) =(15) */
        
        if tag == 11
        {
            isPerformingOperation = true
            previousNumber = Double(resultlable.text!)!
            resultlable.text = "÷"
            operation = tag
            
        }
        else if tag == 12
        {
            isPerformingOperation = true
            previousNumber = Double(resultlable.text!)!
            resultlable.text = "×"
            operation = tag
            
        }
        else if tag == 13
        {
            isPerformingOperation = true
            previousNumber = Double(resultlable.text!)!
            resultlable.text = "-"
            operation = tag
            
        }
        else if tag == 14
        {
            isPerformingOperation = true
            previousNumber = Double(resultlable.text!)!
            resultlable.text = "+"
            operation = tag
            
        }
        else if tag == 19 // decimal
        {
            if(!(resultlable.text?.contains("."))!)
            {
                resultlable.text = resultlable.text! + "."
                currentNumber = Double(resultlable.text!)!
                //isDecimal = true
            }
        }
        else if tag == 18 // percentage
        {
            //resultlable.text = String(Double(resultlable.text!))
        }
            
        else if tag == 15
        {
            /* = + - × ÷ */
            
            // operation (tag)
            
            if operation == 11 // 11 is a tag for division
            {
                resultlable.text = String(previousNumber / currentNumber)
            }
            else if operation == 12 // 12 is a tag for multiplication
            {
                resultlable.text = String(previousNumber * currentNumber)
            }
            else if operation == 13 // 13 is a tag for subtraction
            {
                resultlable.text = String(previousNumber - currentNumber)
            }
            else if operation == 14 // 14 is the tag for addition
            {
                resultlable.text = String(previousNumber + currentNumber)
            }
            
        }
        
}
    @IBAction func backspaceButton(_ sender: Any)
    {
        let tag = (sender as! UIButton).tag
        
        /*  drop the last number from the resultlable*/
        
        if tag == 20
        {
            let num = resultlable.text!.dropLast()
            currentNumber = Double(num) ?? 0.0
            resultlable.text = String(num)
        }
    }
    
}
