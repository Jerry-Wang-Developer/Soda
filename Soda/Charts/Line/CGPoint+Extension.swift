//
//  CGPoint+Extensiono.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/15.
//

import SwiftUI

extension CGPoint {
    static func midPoint(of point1: CGPoint, and point2: CGPoint) -> CGPoint {
        let x = (point1.x + point2.x) / 2
        let y = (point1.y + point2.y) / 2
        return CGPoint(x: x, y: y)
    }
    
    static func controlPoint(of point1: CGPoint, and point2: CGPoint) -> CGPoint {
        var controlPoint = midPoint(of: point1, and: point2)
        let diffY = abs(point2.y - controlPoint.y)
        
        if point1.y < point2.y {
            controlPoint.y += diffY
        } else {
            controlPoint.y -= diffY
        }
        return controlPoint
    }
}
