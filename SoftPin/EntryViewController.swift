//
//  EntryViewController.swift
//  SoftPin
//
//  Created by HungCLo on 7/31/16.
//  Copyright © 2016 Willey.lo. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    let udefault = NSUserDefaults.standardUserDefaults()

    @IBAction func openSoftPin(sender: AnyObject) {
        if udefault.boolForKey(SoftPinConst.IS_USERENROLLED) == false {
            performSegueWithIdentifier("openSetPin", sender: nil)
        } else {
            performSegueWithIdentifier("openConfirmPin", sender: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
