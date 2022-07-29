//
//  UIApplication+Visiable.swift
//  WorkingWithUIKit
//
//  Created by 逸风 on 2022/7/15.
//  Copyright © 2022 Lebus. All rights reserved.
//

import Foundation
import UIKit

let mainKeyWindow = UIApplication.shared.connectedScenes
                        .map({ $0 as? UIWindowScene })
                        .compactMap({ $0 })
                        .first?.windows.first

extension UIApplication {
    
    private func mainWindow() -> UIWindow? {
        return mainKeyWindow
    }
    
    private func _getRootVC() -> UIViewController {
        guard let rootVC: UIViewController = self.mainWindow()?.rootViewController else{
            return UIViewController()
        }
        return rootVC
    }
    
    @objc func visibleViewController() -> UIViewController {
        let rootVC = self._getRootVC()
        let infoVc = self.getVisibleViewControllerInfoFrom(vc: rootVC,topNav: nil)
        return infoVc.vc
    }
    
    @objc func visibleNavigationController() -> UINavigationController? {
        let rootVC = self._getRootVC()
        let infoVc = self.getVisibleViewControllerInfoFrom(vc: rootVC,topNav: nil)
        return infoVc.topNav
    }
    
    private func getVisibleViewControllerInfoFrom(vc: UIViewController,topNav:UINavigationController?) -> (vc:UIViewController,topNav:UINavigationController?) {
        var visibleVC = vc;
        var newTopNav = topNav
        if vc.isKind(of: UINavigationController.self) {
            let naviVC: UINavigationController = vc as! UINavigationController
            visibleVC = naviVC.viewControllers.last!
            newTopNav = naviVC
        } else if vc.isKind(of: UITabBarController.self) {
            let tabbarVC: UITabBarController = vc as! UITabBarController
            visibleVC = tabbarVC.selectedViewController!
        } else if let presentingVC = vc.presentedViewController {
            if presentingVC.isKind(of: UINavigationController.self) {
                let naviVC: UINavigationController = presentingVC as! UINavigationController
                visibleVC = naviVC.viewControllers.last!
                newTopNav = naviVC
            } else {
                visibleVC = presentingVC
            }
        }
        if visibleVC == vc {
            return (vc,newTopNav)
        }
        return self.getVisibleViewControllerInfoFrom(vc: visibleVC,topNav: newTopNav)
    }
    
}
