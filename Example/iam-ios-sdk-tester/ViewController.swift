//
//  ViewController.swift
//  iam-ios-sdk-tester
//
//  Created by torhski on 03/15/2023.
//  Copyright (c) 2023 torhski. All rights reserved.
//

import UIKit
//import iam_ios_sdk_tester

let appId = "appef6720db-cdfb-475d-8f49-703782c2b766"

class ViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        Core.initialize(CoreConfiguration(appId, "ak", "t", "rt"))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    @IBAction func sayHelloTapped(_ sender: Any) {
        helloLabel.text = "Hello 👋"
    }
}

