//
//  SetupPinViewController.swift
//  SoftPin
//
//  Created by LoHung Chang on 2016/5/18.
//  Copyright © 2016年 Willey.lo. All rights reserved.
//

import UIKit

class SetupPinViewController: UIViewController, UITextFieldDelegate {
    
    let userdefault = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var Firstinputtext: UITextField!
    @IBOutlet weak var Secondinputtext: UITextField!
    
    @IBAction func firsttext(sender: AnyObject) {
        if Firstinputtext.text?.characters.count == 4 {
            Secondinputtext.becomeFirstResponder()
        }
    }
    
    @IBAction func secondText(sender: AnyObject) {
        check()
    }
    
    func check() {
        if Secondinputtext.text?.characters.count == 4 {
            if Firstinputtext.text == "" || Secondinputtext.text == "" {
                alertView("Error", message: "The input is empty", button: "Set Again")
                return
            }
            
            if Firstinputtext.text! == Secondinputtext.text! {
                userdefault.setObject(Secondinputtext.text, forKey: SoftPinConst.USER_ENROLLEDPIN)
                userdefault.setBool(true, forKey: SoftPinConst.IS_USERENROLLED)
                cleanTxt()
                self.performSegueWithIdentifier("enterPin", sender: self)
                
            } else {
                cleanTxt()
                alertView("Error", message: "The input is not equal", button: "Set Again")
                return
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTxt()
        keyboardType()
    }
    
    func setTxt() {
        Firstinputtext.delegate = self
        Secondinputtext.delegate = self
        Firstinputtext.secureTextEntry  = true
        Secondinputtext.secureTextEntry = true
    }
    
    func alertView(title: String, message: String, button: String) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: button, style: .Default, handler: nil)
        alertView.addAction(okAction)
        self.presentViewController(alertView, animated: true, completion: nil)
    }
    
    //clean the uitextfield
    func cleanTxt() {
        Firstinputtext.text = ""
        Secondinputtext.text = ""
        Firstinputtext.becomeFirstResponder()
    }
    
    func keyboardType() {
        Firstinputtext.keyboardType = .NumberPad
        Secondinputtext.keyboardType = .NumberPad
    }
    
}
