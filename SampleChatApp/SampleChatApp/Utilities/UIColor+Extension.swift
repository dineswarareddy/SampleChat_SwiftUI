//
//  UIColor+Extension.swift
//  SampleChatApp
//
//  Created by Dineswarareddy on 07/11/24.
//

import UIKit

extension UIColor {
  
  static func chatBlueColor(alpha: CGFloat = 1.0) -> UIColor {
    return UIColor.colorFromHex(rgbValue: 0x0B61C7, alpha: alpha)
  }
  
  static func chatBackgroundGray(alpha: CGFloat = 1.0) -> UIColor {
    return UIColor.colorFromHex(rgbValue: 0xC2C2C2, alpha: alpha)
  }
  
  public class func colorFromHex(rgbValue: UInt32, alpha: CGFloat = 1.0) -> UIColor {
    let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
    let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
    let blue = CGFloat(rgbValue & 0xFF)/256.0
    return UIColor(red:red, green:green, blue:blue, alpha:alpha)
  }
}
