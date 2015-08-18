//
//  ViewController.swift
//  Calculator
//
//  Created by iMac21.5 on 4/7/15.
//  Copyright (c) 2015 Garth MacKenzie. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    var digit = ""
    var num1 = 0.0
    var num2 = 0.0
    var result = 0.0
    var oper = ""
    var mem = 0.0
    
    @IBAction func math(sender: UIButton) {
        digit = sender.currentTitle!
        oper = digit
        if result != 0.0 {
            num1 = result
        }
        else {
            num1 = num2
        }
        num2 = 0.0
        result = 0.0
        println("result = \(result), num1 = \(num1),  num2 = \(num2), oper = \(oper)")
    }
    @IBAction func plusMinus(sender: UIButton) {
        if display.text!.hasPrefix("-") {
            display.text = display.text!.stringByReplacingOccurrencesOfString("-" , withString: "")
        }
        else {
            display.text = "-" + display.text!
        }
        if result != 0.0 {
            result = -result
        }
        else {
            num2 = -num2
        }
        println("result = \(result), num1 = \(num1),  num2 = \(num2), oper = \(oper)")
    }
    @IBAction func clearMemory(sender: UIButton) {
        mem = 0.0
    }
    @IBAction func memoryAdd(sender: UIButton) {
        mem = mem + NSNumberFormatter().numberFromString(display.text!)!.doubleValue
    }
    @IBAction func memoryMinus(sender: UIButton) {
        mem = mem - NSNumberFormatter().numberFromString(display.text!)!.doubleValue
    }
    @IBAction func memRecall(sender: UIButton) {
        display.text = "\(mem)"
        num2 = mem
    }
    @IBAction func equals(sender: UIButton) {
        println("result = \(result), num1 = \(num1),  num2 = \(num2), oper = \(oper)")
        if oper == "/" {
        display.text = "\(result = num1/num2)"
        }
        if oper == "X"{
        display.text = "\(result = num1*num2)"
        }
        if oper == "－"{
            display.text = "\(result = num1-num2)"
        }
        if oper == "＋" {
            display.text = "\(result = num1+num2)"
        }
        oper = ""
        display.text = "\(result)"
        println("result = \(result), num1 = \(num1),  num2 = \(num2), oper = \(oper)")
    }

    @IBAction func clearDisplay(sender: UIButton) {
        display.text = "0"
        num1 = 0.0
        num2 = 0.0
        result = 0.0
        oper = ""
        println("result = \(result), num1 = \(num1),  num2 = \(num2), oper = \(oper)")
    }

    @IBAction func pi(sender: UIButton) {
        display.text = "\(22.0/7.0)"
        num2 = M_PI
    }
    @IBAction func squared(sender: UIButton) {
        let x = NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        display.text = "\(x*x)"
        num2 = x*x
    }
    @IBAction func squareRoot(sender: UIButton) {
        let y = sqrt( NSNumberFormatter().numberFromString(display.text!)!.doubleValue)
        display.text = "\(y)"
        num2 = y
    }
    @IBAction func appendDigit(sender: UIButton) {
        println("result = \(result), num1 = \(num1),  num2 = \(num2), oper = \(oper)")
        digit = sender.currentTitle!
        if digit != "." {
            if display.text == "0" {
                display.text = digit
                num2 = NSNumberFormatter().numberFromString(display.text!)!.doubleValue
                return
            }
            if display.text!.hasSuffix(".") {
                display.text = display.text! + digit
            }
            else {
                if display.text!.hasPrefix(".") {
                    display.text = display.text! + digit
                }
                else {
                    if display.text!.hasPrefix("-.") {
                        display.text = display.text! + digit
                    }
                    else {
                        if num1.isZero || result != 0.0 || (num2 != 0.0 && digit != "") {
                            display.text = display.text! + digit
                        }
                        else {
                            display.text = digit
                        }
                    }
                }
            }
        }
        else {  /*     digit = "."         */
            if display.text!.hasSuffix(".") {
                display.text = display.text! + digit
            }
            else {
                if display.text!.hasPrefix(".") {
                    display.text = display.text! + digit
                }
                else {
                    if display.text!.hasPrefix("-.") {
                        display.text = display.text! + digit
                    }
                    else {
                        if num1.isZero || result != 0.0 || (num2 != 0.0 && digit != "") {
                            display.text = display.text! + digit
                        }
                        else {
                            display.text = digit
                        }
                    }
                }
            }
        }
        if digit == "." || (digit == "0" && num2 == 0.0) {
            num2 = 0.0
        }
        else {
            num2 = NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        println("result = \(result), num1 = \(num1),  num2 = \(num2), oper = \(oper)") }
}