//
//  JFNavigationViewController.swift
//  NaviteMixinFlutterDemo
//
//  Created by 逸风 on 2022/7/27.
//

import UIKit

class JFNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func removeFromParent() {
        print("JFNavigationViewController removeFromParent")
    }
    
    deinit {
        print("JFNavigationViewController dealloc")
    }

}
