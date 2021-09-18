//
//  Line.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/16.
//

import CoreGraphics

struct Line {
    let start: CGPoint
    let end: CGPoint
    
    var length: CGFloat {
        Line.lenght(from: start, to: end)
    }
    
    func length(to: CGPoint) -> CGFloat {
        Line.lenght(from: start, to: to)
    }
    
    func length(toX x: CGFloat) -> CGFloat {
        length(to: point(ofX: x))
    }
    
    private func point(ofX x: CGFloat) -> CGPoint {
        let slope = (end.y - start.y) / (end.x - start.x)
        let y = start.y + (x - start.x) * slope
        return CGPoint(x: x, y: y)
    }
    
    static func lenght(from p1: CGPoint, to p2: CGPoint) -> CGFloat {
        sqrt((pow(p1.x - p2.x, 2) + pow(p1.y - p2.y, 2)))
    }
}
