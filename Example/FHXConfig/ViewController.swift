//
//  ViewController.swift
//  FHXConfig
//
//  Created by fenghanxu on 07/04/2018.
//  Copyright (c) 2018 fenghanxu. All rights reserved.
//

import UIKit
import FHXConfig

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
      print("机型 = \(Device.type)")
      print("判断机型做出选择 = \(Device.type  == Device.ScreenType.iPhone_Plus ? "1" : "2")")
      //获取屏幕信息
      print("获取屏幕信息 = \(Macro.screenBound)")
      //获取屏幕宽度
      print("获取屏幕宽度 = \(Macro.screenWidth)")
      //获取屏幕高度
      print("获取屏幕高度 = \(Macro.screenHeight)")
      //获取状态栏高度
      print("获取状态栏高度 = \(Macro.statusHeight)")
      //获取状态栏和导航栏的高度
      print("获取状态栏和导航栏的高度 = \(Macro.statusAndNavBarHeight)")
      /// 获取通知中心
      Macro.notification//用于创建通知,消除通知
      /// 获取UIApplication单例对象
      Macro.application//Macro.application.keyWindow?.endEditing(true)
      /// 获取keyWindow对象
      Macro.keyWindow//Macro.keyWindow?.endEditing(true)
      /// 获取当前 rootVC
      Macro.rootVC//Macro.rootVC?.present(alert, animated: true, completion: nil)
      /// 获取当前VC
      /*
       一般用于获取当前控制器点出导航栏。
       guard let current = Macro.currentVC.navigationController else { return }
       或者判断当前控制器的类型
       guard let vc = Macro.currentVC as? HomeViewController else { return }
       跳转控制器
       Macro.currentVC.present(nav, animated: true, completion: nil)
       */

      print("\(Macro.currentVC)")
      
    }



}

