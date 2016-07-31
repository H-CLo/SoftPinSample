//
//  EnterPinViewController.swift
//  SoftPin
//
//  Created by LoHung Chang on 2016/5/18.
//  Copyright © 2016年 Willey.lo. All rights reserved.
//

import UIKit

class EnterPinViewController: UIViewController, UITextFieldDelegate {
    let udefault = NSUserDefaults.standardUserDefaults()
    var setTimes = 5
    
    @IBOutlet weak var enterPintext: UITextField!
    
    @IBAction func checkPin(sender: AnyObject) {
        // if the user registered, enrolled!
        if enterPintext.text?.characters.count == 4 {
            if udefault.objectForKey(SoftPinConst.USER_ENROLLEDPIN) as? String == enterPintext.text {
                let dialog = UIAlertController(title: "SUCCESS", message: "Verify Pin success", preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default, handler: { action in
                    self.performSegueWithIdentifier("enrolled", sender: nil)
                })
                dialog.addAction(action)
                presentViewController(dialog, animated: true, completion: nil)
            } else {
                enrollRestrict()
                enterPintext.text = ""
                enterPintext.becomeFirstResponder()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterPintext.delegate = self
        enterPintext.secureTextEntry = true
        enterPintext.becomeFirstResponder()
        keyboardType()
    }
    
    func enrollRestrict() {
        if setTimes > 1 {
            setTimes -= 1
            let dialog = UIAlertController(title: "The Pin isn't comfirmed", message: "You still have \(setTimes) chances", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "Try Again", style: .Default, handler: nil)
            dialog.addAction(okAction)
            self.presentViewController(dialog, animated: true, completion: nil)
        } else {
        }
    }
    
    func keyboardType() {
        enterPintext.keyboardType = .NumberPad
    }
}
