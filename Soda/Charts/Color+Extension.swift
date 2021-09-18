//
//  Color+Extension.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/15.
//

import SwiftUI

extension Color {
    /**
     Creates a color from an hex integer (e.g. 0x3498db).
     - parameter hex: A hexa-decimal UInt64 that represents a color.
     - parameter opacityChannel: If true the given hex-decimal UInt64 includes the opacity channel (e.g. 0xFF0000FF).
     */
    init(hex: UInt64, hasOpacityChannel: Bool = false) {
      let mask      = UInt64(0xFF)
      let cappedHex = !hasOpacityChannel && hex > 0xffffff ? 0xffffff : hex

      let r = cappedHex >> (hasOpacityChannel ? 24 : 16) & mask
      let g = cappedHex >> (hasOpacityChannel ? 16 : 8) & mask
      let b = cappedHex >> (hasOpacityChannel ? 8 : 0) & mask
      let o = hasOpacityChannel ? cappedHex & mask : 255

      let red     = Double(r) / 255.0
      let green   = Double(g) / 255.0
      let blue    = Double(b) / 255.0
      let opacity = Double(o) / 255.0

      self.init(red: red, green: green, blue: blue, opacity: opacity)
    }
}
