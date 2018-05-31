//
//  ViewController.swift
//  IOS-SWift-CustomColors
//
//  Created by Pooya on 2018-05-31.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var redVal: UITextField!
    @IBOutlet weak var greenVal: UITextField!
    @IBOutlet weak var blueVal: UITextField!
    @IBOutlet weak var hexVal: UITextField!
    
    @IBOutlet weak var rgbArea: UILabel!
    @IBOutlet weak var hexArea: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    @IBAction func rgbBtn(_ sender: Any) {
        
        let redIn : Int = Int(self.redVal!.text ?? "0") ?? 0
        let greenIn : Int = Int(self.greenVal!.text ?? "0") ?? 0
        let blueIn : Int = Int(self.blueVal!.text ?? "0") ?? 0

        rgbArea.backgroundColor = UIColor(red: redIn, green: greenIn, Blue: blueIn, alpha: 1)
        
    }
    
    
    @IBAction func hexBtn(_ sender: Any) {
        
        let hexInS : String = self.hexVal!.text!
        let hexIn =  hexInS == "" ? "000000" : hexInS
        
        //Validating
        if isValidColor(testStr: hexIn) {
            self.hexVal.layer.backgroundColor = UIColor.black.cgColor
        } else {
            self.hexVal.layer.backgroundColor = UIColor.red.cgColor
            return
        }
        
        hexArea.backgroundColor = UIColor(hex: hexIn, alpha: 1)
    }
    
    func isValidColor(testStr:String) -> Bool {
        let colorRegEx = "[A-F0-9a-f]{6}"
        let colorTest = NSPredicate(format: "SELF MATCHES %@", colorRegEx)
        return colorTest.evaluate(with: testStr)
    }


}

