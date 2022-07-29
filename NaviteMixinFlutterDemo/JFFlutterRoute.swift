//
//  JFFlutterRoute.swift
//  NaviteMixinFlutterDemo
//
//  Created by 逸风 on 2022/7/26.
//

import UIKit
import flutter_boost

struct JFFluterRouteName {
    static let loginPage = "jf://loginPage"
    static let nativeMainPage = "jf://nativeMainPage"
    static let demoPage = "jf://demoPage"
    static let nativePage = "jf://nativePage"
}

class JFFlutterRoute: NSObject {
    
    static let needBgViewRoutes: [String] = [
        JFFluterRouteName.loginPage,
    ]
    
    static let shareInstance = JFFlutterRoute()
    
    func openUrl(url: String, arguments: [AnyHashable : Any] = [:]) {
        let option = FlutterBoostRouteOptions()
        option.pageName = url
        option.arguments = arguments
        FlutterBoost.instance().open(option)
    }

}

extension JFFlutterRoute: FlutterBoostDelegate {
    internal func pushNativeRoute(_ pageName: String!, arguments: [AnyHashable : Any]!) {
        switch pageName {
        case JFFluterRouteName.nativeMainPage:
            let vc = ViewController()
            let navi = JFNavigationViewController(rootViewController: vc)
            AppDelegate.switchRootVC(vc: navi)
            break
        case JFFluterRouteName.nativePage:
            let vc = ViewController()
            vc.title = "原生二级页面"
            UIApplication.shared.visibleNavigationController()?.pushViewController(vc, animated: true)
            break
        default:
            break
        }
    }
    
    internal func pushFlutterRoute(_ options: FlutterBoostRouteOptions!) {
        guard let vc = JFFlutterViewController() else { return }
        vc.setName(options.pageName, uniqueId: options.uniqueId, params: options.arguments, opaque: options.opaque)
        UIApplication.shared.visibleNavigationController()?.pushViewController(vc, animated: true)
    }
    
    internal func popRoute(_ options: FlutterBoostRouteOptions!) {
        //只演示push,pop.  present dismiss的处理 自己处理
        UIApplication.shared.visibleNavigationController()?.popViewController(animated: true)
    }
}
