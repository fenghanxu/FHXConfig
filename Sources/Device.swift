//
//  Device.swift
//  BLFoundation
//
//  Created by bigl on 2017/10/17.
//

import UIKit


public struct Device {
  
  public enum ScreenType: Int {
    case iPhone_SE
    case iPhone_S
    case iPhone_Plus
    case iPhone_X
    case iPad
    case unknown
  }
  
  public static var type: ScreenType {
    if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
      return .iPad
    }
    
    let size = UIScreen.main.bounds.size
    switch (size.width,size.height){
    case (812,375),(375,812): return .iPhone_X
    case (736,414),(414,736): return .iPhone_Plus
    case (667,375),(375,667): return .iPhone_S
    case (568,320),(320,568): return .iPhone_SE
    default: return .unknown
    }
  }
  
}
