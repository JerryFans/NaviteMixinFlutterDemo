//
//  AppDelegate.swift
//  NaviteMixinFlutterDemo
//
//  Created by 逸风 on 2022/7/26.
//

import UIKit
import flutter_boost

extension AppDelegate {
    func registerFlutter(application: UIApplication) {
        FlutterBoost.instance().setup(application, delegate: JFFlutterRoute.shareInstance) { engine in
            guard let _ = engine else { return }
            print("engine success")
            //you can register your channel in there.
        }
    }
}


//@main
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    class func switchRootVC(vc: UIViewController) {
        if let navi = UIApplication.shared.visibleNavigationController() {
            for vc in navi.viewControllers {
                if vc.isKind(of: JFFlutterViewController.self) {
                    let fvc = vc as! JFFlutterViewController
                    fvc.detachFlutterEngineIfNeeded()
                    fvc.notifyWillDealloc()
                }
            }
        }
        mainKeyWindow?.rootViewController = vc
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //模拟加载稍慢，不然启动图很快，看不出差异
        sleep(1)
        //加载flutter引擎
        registerFlutter(application: application)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }


}

