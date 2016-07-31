//
//  EnrolledViewController.swift
//  SoftPin
//
//  Created by LoHung Chang on 2016/5/18.
//  Copyright © 2016年 Willey.lo. All rights reserved.
//

import UIKit

class EnrolledViewController: UIViewController {
    let udefault = NSUserDefaults.standardUserDefaults()
    
    @IBAction func removePinButton(sender: AnyObject) {
        udefault.removeObjectForKey(SoftPinConst.USER_ENROLLEDPIN)
        udefault.setBool(false, forKey: SoftPinConst.IS_USERENROLLED)
        openEntryView()
    }
    @IBAction func openEntryView(sender: AnyObject) {
        openEntryView()
    }
    
    func openEntryView() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: UIViewController = storyboard.instantiateViewControllerWithIdentifier("EntryViewController") as UIViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }
}
