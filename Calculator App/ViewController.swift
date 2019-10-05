//
//  ViewController.swift
//  Calculator App
//
//  Created by Nisha Tandel on 2019-09-25.
//  Copyright © 2019 Nisha Tandel. All rights reserved.
//
// Assignment 1 : Calculator App
// NAME : Nisha Jitendrakumar Tandel
// Student Id : 301094688
// Date : 4th October 2019
// Version History : Added functionlity for button.
                    // operator (+, -, %, *, ., /, backspace,clear)
// Description : Final updated application with                        mathametical functions.

import UIKit

class ViewController: UIViewController {
    // This will display the result of the opertions.
    @IBOutlet weak var resultlable: UILabel!
    
    // defined variables
    var currentNumber: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var isPerformingOperation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultlable.text = ""
    }
    // this function will be executed when the numbers are pressed.
    @IBAction func NumberPressed(_ sender: Any)
    {
// "let method" will let function to work when pressed UI button
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
    // This function will execute when the operator will be pressed.s
    @IBAction func operatorPressed(_ sender: Any) {
        
        let tag = (sender as! UIButton).tag
        
        /* clear button - tag 16 */
        if tag == 16{
            resultlable.text = ""
            previousNumber = 0
            currentNumber = 0
            operation = 0
            
            return
        }
        
        /* operation(its tag) ÷(11) ×(12) -(13) +(14) =(15) .(19) %(18)*/
        
        if tag == 11 // division
        {
            isPerformingOperation = true
            previousNumber = Double(resultlable.text!)!
            resultlable.text = "÷"
            operation = tag
            
        }
        else if tag == 12 //Multiplication
        {
            isPerformingOperation = true
            previousNumber = Double(resultlable.text!)!
            resultlable.text = "×"
            operation = tag
            
        }
        else if tag == 13 // Subtraction
        {
            isPerformingOperation = true
            previousNumber = Double(resultlable.text!)!
            resultlable.text = "-"
            operation = tag
            
        }
        else if tag == 14 // addition
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

            }
        }
        else if tag == 18 // percentage
        {
             isPerformingOperation = true
            resultlable.text = String(Double(resultlable.text!)!/100)
            
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
    // when backspace is pressed this function is called.
    @IBAction func backspaceButton(_ sender: Any)
    {
        let tag = (sender as! UIButton).tag
        
        /*  drop the last number from the resultlable*/
        // 20 is the tag for backspace button
        
        if tag == 20 //backspace
        {
            let num = resultlable.text!.dropLast()
            currentNumber = Double(num) ?? 0.0
            resultlable.text = String(num)
        }
    }
    
}
