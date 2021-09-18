//
//  Curve.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/16.
//

import CoreGraphics

struct Curve {
    let start: CGPoint
    let end: CGPoint
    let controls: [CGPoint]

    var length: CGFloat {
        var length: CGFloat = 0
        let steps = 100
        var p0: CGPoint = start
        
        for i in 0..<steps {
            let delta = CGFloat(i + 1) / CGFloat(steps)
            let p1 = point(atDelta: delta)
            length += Line(start: p0, end: p1).length
            p0 = p1
        }
        return length
    }
    
    func length(toX x: CGFloat) -> CGFloat {
        var length: CGFloat = 0
        let steps = 100
        var p0: CGPoint = start

        for i in 0..<Int(steps) {
            let delta = CGFloat(i + 1) / CGFloat(steps)
            let p1 = point(atDelta: delta)
            if x <= p0.x {
                return length
            } else if x <= p1.x {
                length += Line(start: p0, end: p1).length(toX: x)
                return length
            }
            
            length += Line(start: p0, end: p1).length
            p0 = p1
        }
        return length
    }
    
    private func point(atDelta delta: CGFloat) -> CGPoint {
        let x = bezier(points: [start.x] + controls.map(\.x) + [end.x], t: delta)
        let y = bezier(points: [start.y] + controls.map(\.y) + [end.y], t: delta)
        return CGPoint(x: x, y: y)
    }
}
