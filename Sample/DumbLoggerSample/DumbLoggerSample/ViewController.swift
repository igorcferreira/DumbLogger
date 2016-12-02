//
//  ViewController.swift
//  DumbLoggerSample
//
//  Created by Igor Ferreira on 01/12/16.
//  Copyright © 2016 Igor Ferreira. All rights reserved.
//

import UIKit
import DumbLogger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let logger = DumbLogger(output: ApiOutput(), level: .information)
        logger.put("Some message", level: .error)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

