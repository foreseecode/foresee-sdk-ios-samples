//
//  ViewController.swift
//  BasicSwiftSample
//
//  Created by Wayne Burkett on 10/8/15.
//  Copyright © 2015 ForeSee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var showInviteButton: UIButton!
    
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		ForeSee.setDebugLogEnabled(true)
		ForeSee.resetState()
		ForeSee.checkIfEligibleForSurvey()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

    @IBAction func handleShowInviteButtonTouchUpInside(_ sender: AnyObject) {
        ForeSee.resetState()
        ForeSee.checkIfEligibleForSurvey()
    }
}

