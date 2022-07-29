//
//  JFFlutterViewController.swift
//  NaviteMixinFlutterDemo
//
//  Created by 逸风 on 2022/7/26.
//

import UIKit
import flutter_boost

extension UIImage {
    class func jf_convertViewToImage(view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
        guard let currentContext = UIGraphicsGetCurrentContext() else {
            return nil
        }
        view.layer.render(in: currentContext)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

fileprivate var JFFlutterLoginBgColor: UIColor? = nil

class JFFlutterViewController: FBFlutterViewContainer {
    
    var priviousBarHidden = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        tryChangeLoginBgColorIfNeed()
        // Do any additional setup after loading the view.
    }
    
    private func tryChangeLoginBgColorIfNeed() {
        guard JFFlutterRoute.needBgViewRoutes.contains(self.name) else { return }
        if let color = JFFlutterLoginBgColor {
            //use cache color
            print("use cache color")
            self.view.backgroundColor = color
            return
        }
        let screenSize = UIScreen.main.bounds.size
        let launchView = UIImageView(image: UIImage(named: "bg"))
        launchView.contentMode = .scaleToFill
        launchView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        if let image = UIImage.jf_convertViewToImage(view: launchView) {
            let myColor = UIColor(patternImage: image)
            JFFlutterLoginBgColor = myColor
            self.view.backgroundColor = myColor
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.priviousBarHidden = self.navigationController?.isNavigationBarHidden ?? false
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(self.priviousBarHidden, animated: animated)
    }

}
