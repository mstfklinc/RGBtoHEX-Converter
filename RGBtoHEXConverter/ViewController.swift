//
//  ViewController.swift
//  RGBtoHEXConverter
//
//  Created by apple on 7.12.2019.
//  Copyright © 2019 Mustafa KILINÇ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtRed: UITextField!
    @IBOutlet weak var txtGreen: UITextField!
    @IBOutlet weak var txtBlue: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var lblSelectedColor: UILabel!
    var secilenIndex : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        secilenIndex = sender.selectedSegmentIndex
        lblResult.text?.removeAll()
        txtRed.text?.removeAll()
        txtGreen.text?.removeAll()
        txtBlue.text?.removeAll()
        lblSelectedColor.backgroundColor = UIColor.white
        
        
        if secilenIndex == 0
        {
            btnConvert.setTitle("RGB - HEX Çevir", for: UIControl.State.normal)
        }
        else
        {
            btnConvert.setTitle("HEX - RGB Çevir", for: UIControl.State.normal)
            
        }
    }
    
    
    @IBAction func btnConvertClicked(_ sender: UIButton) {
        
        if secilenIndex == 0
            {
                // RGB den HEX e çeviri yapılıyor.
                convertRGBtoHex()
        }
        else
        {
            // HEX ten RGB ye çeviri yapılıyor.
            convertHEXtoRGB()
        }
    }
    
    func convertRGBtoHex()
    {
        if let redValue = UInt8(txtRed.text!)
        {
            if let greenValue = UInt8(txtGreen.text!)
            {
                if let blueValue = UInt8(txtBlue.text!)
                {
                    let redHex = String(format: "%2X", redValue)
                    let greenHex = String(format: "%2X", greenValue)
                    let blueHex = String(format: "%2X", blueValue)
                    lblResult.text = "HEX Color : #\(redHex)\(greenHex)\(blueHex)"
                    lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                }
            }
        }
    }
    
    func convertHEXtoRGB()
    {
        if let redValue = UInt8(txtRed.text!, radix: 16)
        {
            if let greenValue = UInt8(txtGreen.text!, radix: 16)
            {
                if let blueValue = UInt8(txtBlue.text!, radix: 16)
                {
                    lblResult.text = "RED : \(redValue) \n GREEN : \(greenValue) \n BLUE : \(blueValue)"
                   lblSelectedColor.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                }
            }
        }
    }
    
    
    

}

