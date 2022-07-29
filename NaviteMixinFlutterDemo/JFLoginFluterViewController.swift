//
//  JFLoginFluterViewController.swift
//  NaviteMixinFlutterDemo
//
//  Created by 逸风 on 2022/7/27.
//

import UIKit

class JFLoginFluterViewController: JFFlutterViewController {
    
    override init() {
        super.init()
        self.name = JFFluterRouteName.loginPage
        self.setName(JFFluterRouteName.loginPage, uniqueId: "", params: [:], opaque: true)
    }
    
    deinit {
        print("JFLoginFluterViewController dealloc")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
