//
//  ViewController.swift
//  Stock Price Calculator
//
//  Created by Roman on 1/24/16.
//  Copyright © 2016 Roman Puzey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var txtOriginalPrice: UITextField!
    @IBOutlet weak var txtAmountBought: UITextField!
    @IBOutlet weak var txtSellingPrice: UITextField!


    @IBOutlet weak var lblPercentIncrease: UILabel!
    @IBOutlet weak var lblProfit: UILabel!

    var originalPrice = ""
    var amountBought = ""
    var sellingPrice = ""

    var percentIncrease : Float = 0
    var profit : Float = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnCalculateACTION(sender: UIButton)
    {
        takeInData()
        calculatePrice()
    }

    @IBAction func btnClearACTION(sender: UIButton)
    {
        clear()
    }

    func takeInData()
    {
        originalPrice = txtOriginalPrice.text!
        amountBought = txtAmountBought.text!
        sellingPrice = txtSellingPrice.text!
    }

    func calculatePrice()
    {
        var fOriginalPrice = Float(originalPrice)
        var fAmountBought = Float(amountBought)
        var fSellingPrice = Float(sellingPrice)

        percentIncrease = (fSellingPrice! / fOriginalPrice! - 1) * 100
        profit = (fSellingPrice! * fAmountBought!) - (fOriginalPrice! * fAmountBought!)

        printProfit()
    }

    func clear()
    {
        txtAmountBought.text = ""
        txtOriginalPrice.text = ""
        txtSellingPrice.text = ""

        lblPercentIncrease.text = "Percent Increase"
        lblProfit.text = "Profit"
    }

    func printProfit()
    {
        var sPercent = String(format: "%0.2f", percentIncrease)
        var sProfit = String(format: "%0.2f", profit)

        lblPercentIncrease.text = "\(sPercent)%"
        lblProfit.text = "$\(sProfit)"
    }

    func hideTheKeyboard()
    {
        txtAmountBought.resignFirstResponder()
        txtOriginalPrice.resignFirstResponder()
        txtSellingPrice.resignFirstResponder()
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        hideTheKeyboard()
    }
}

