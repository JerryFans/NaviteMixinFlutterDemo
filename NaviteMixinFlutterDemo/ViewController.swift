//
//  ViewController.swift
//  NaviteMixinFlutterDemo
//
//  Created by 逸风 on 2022/7/26.
//

import UIKit
import flutter_boost

class ViewController: UIViewController {
    
    lazy var testButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .blue
        btn.setTitle("跳转Flutter", for: .normal)
        btn.addTarget(self, action: #selector(clickActon), for: .touchUpInside)
        btn.frame = CGRect(x: 50, y: 100, width: 100, height: 44)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "原生首页"
        self.view.addSubview(self.testButton)
        
    }
    
    @objc func clickActon() {
        JFFlutterRoute.shareInstance.openUrl(url: JFFluterRouteName.demoPage)
    }

}

