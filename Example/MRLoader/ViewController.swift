//
//  ViewController.swift
//  MRLoader
//
//  Created by Masoud Roosta on 02/21/2020.
//  Copyright (c) 2020 Masoud Roosta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let mrLoader : MRLoaderView = {
        let view = MRLoaderView()
        view.animating = true
        view.SameRotation = false
        view.doubleSpiner = false
        view.backgroundColor = .clear
        view.tintColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
//        uncomment above code to add loader programmatically
//        view.addSubview(mrLoader)
//        NSLayoutConstraint.activate([
//            mrLoader.widthAnchor.constraint(equalToConstant: 100),
//            mrLoader.heightAnchor.constraint(equalToConstant: 100),
//            mrLoader.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            mrLoader.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//
//        ])

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

