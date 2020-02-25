//
//  ViewController.swift
//  MRLoader
//
//  Created by Masoud Roosta on 02/21/2020.
//  Copyright (c) 2020 Masoud Roosta. All rights reserved.
//

import UIKit
import MRLoader

class ViewController: UIViewController {
    
    
    @IBOutlet weak var first: MRLoaderView!
    @IBOutlet weak var second: MRLoaderView!
    @IBOutlet weak var third: MRLoaderView!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        first.animating = true
        first.SameRotation = false
        first.doubleSpiner = false
        first.lineWidth = 16
        first.tintColor = .red

        second.animating = true
        second.doubleSpiner = true
        second.SameRotation = false
        second.lineWidth = 8
        second.tintColor = .black


        third.animating = true
        third.doubleSpiner = true
        third.SameRotation = true
        third.lineWidth = 4
        third.tintColor = .green


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

