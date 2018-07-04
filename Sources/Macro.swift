//
//  Macro.swift
//  BLConfig
//
//  Created by bigl on 2017/10/17.
//

import UIKit

public struct Macro {
  /// 获取通知中心
  public static let notification = NotificationCenter.default
  /// 获取UIApplication单例对象
  public static var application: UIApplication { return UIApplication.shared }
  /// 获取keyWindow对象
  public static var keyWindow: UIWindow? { return application.keyWindow }
  /// 获取当前 rootVC
  public static var rootVC: UIViewController? { return keyWindow?.rootViewController }
  /// 获取当前VC
  public static var currentVC: UIViewController {
    func find(rawVC: UIViewController) -> UIViewController {
      switch rawVC {
      case let nav as UINavigationController:
        guard let vc = nav.viewControllers.last else { return rawVC }
        return find(rawVC: vc)
      case let tab as UITabBarController:
        guard let vc = tab.selectedViewController else { return rawVC }
        return find(rawVC: vc)
      case let vc where vc.presentedViewController != nil:
        return find(rawVC: vc.presentedViewController!)
      default:
        return rawVC
      }
    }
    guard let rootViewController = UIApplication.shared.windows.filter({ (item) -> Bool in
      /// =.=,如果没手动设置的话...
      return item.windowLevel == 0.0 && item.isKeyWindow
    }).first?.rootViewController else {
//      assert(false)
      return UIViewController()
    }
    return find(rawVC: rootViewController)
  }
  
  // MARK: - 全局常用属性
  public static let screenBound:  CGRect  = UIScreen.main.bounds
  public static let screenWidth:  CGFloat = UIScreen.main.bounds.width
  public static let screenHeight: CGFloat = UIScreen.main.bounds.height
  public static var statusHeight: CGFloat{ return UIApplication.shared.statusBarFrame.height }
  public static var navBarHeight: CGFloat{
    return Device.type == .iPhone_X ? 44 : 44
  }
  public static var tabbarHeight: CGFloat{
    return Device.type == .iPhone_X ? 83 : 49
  }
  public static var statusAndNavBarHeight: CGFloat{
    return  44 + statusHeight
  }
  
  //    /// 在模拟器上执行
  //    public static func onSimulator(_ fun: () -> Void) {
  //      #if (arch(x86_64) || arch(i386)) && os(iOS)
  //        fun()
  //      #endif
  //    }
  //
  //    /// 是否为模拟器
  //    public static func isSimulator() -> Bool{
  //      #if (arch(x86_64) || arch(i386)) && os(iOS)
  //        return true
  //      #endif
  //      return false
  //    }
}

