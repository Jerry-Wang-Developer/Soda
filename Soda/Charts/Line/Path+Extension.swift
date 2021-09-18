//
//  Path+.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/14.
//

import SwiftUI

// https://juejin.cn/post/6844903666361565191

extension Path {
    static func quadCurvedPath(withPoints points: [Double], step: CGPoint) -> Path {
        var path = Path()
        guard points.count >= 2,
              let offset = points.min() else {
            return path
        }
        
        var point1 = CGPoint(x: 0, y: CGFloat(points[0] - offset) * step.y)
        path.move(to: point1)
        for index in 1..<points.count {
            let point2 = CGPoint(x: step.x * CGFloat(index), y: step.y * CGFloat(points[index] - offset))
            let midPoint = CGPoint.midPoint(of: point1, and: point2)
            path.addQuadCurve(to: midPoint, control: CGPoint.controlPoint(of: midPoint, and: point1))
            path.addQuadCurve(to: point2, control: CGPoint.controlPoint(of: midPoint, and: point2))
            point1 = point2
        }
        return path
    }
    
    static func quadClosedCurvedPath(withPoints points: [Double], step: CGPoint) -> Path {
        var path = Path()
        guard points.count >= 2,
              let offset = points.min() else {
            return path
        }
        
        path.move(to: .zero)
        var point1 = CGPoint(x: 0, y: CGFloat(points[0] - offset) * step.y)
        path.addLine(to: point1)
        for index in 1..<points.count {
            let point2 = CGPoint(x: step.x * CGFloat(index), y: step.y * CGFloat(points[index] - offset))
            let midPoint = CGPoint.midPoint(of: point1, and: point2)
            path.addQuadCurve(to: midPoint, control: CGPoint.controlPoint(of: midPoint, and: point1))
            path.addQuadCurve(to: point2, control: CGPoint.controlPoint(of: midPoint, and: point2))
            point1 = point2
        }
        path.addLine(to: CGPoint(x: point1.x, y: 0))
        path.closeSubpath()
        return path
    }
    
    func point(ofX x: CGFloat) -> CGPoint {
        let totalLength = length
        let subLength = length(toX: x)
        let percent = subLength / totalLength
        return point(forPercent: percent)
    }
    
    func point(forPercent percent: CGFloat) -> CGPoint {
        let path = trimmedPath(percent: percent)
        return CGPoint(x: path.boundingRect.midX, y: path.boundingRect.midY)
    }
    
    private func trimmedPath(percent: CGFloat) -> Path {
        let boundsDistance: CGFloat = 0.001
        let completion: CGFloat = 1 - boundsDistance
        
        let pct = percent > 1 ? 0 : (percent < 0 ? 1 : percent)
        
        let start = pct > completion ? completion : pct - boundsDistance
        let end = pct > completion ? 1 : pct + boundsDistance
        return trimmedPath(from: start, to: end)
    }
}

private extension Path {
    var length: CGFloat {
        var length: CGFloat = 0.0
        var start: CGPoint?
        var from: CGPoint = .zero
        
        forEach { element in
            switch element {
            case let .move(to: to):
                if start == nil {
                    start = to
                }
                from = to
            case let .line(to: to):
                length += Line(start: from, end: to).length
                from = to
            case let .quadCurve(to: to, control: control):
                length += Curve(start: from, end: to, controls: [control]).length
                from = to
            case let .curve(to: to, control1: control1, control2: control2):
                length += Curve(start: from, end: to, controls: [control1, control2]).length
                from = to
            case .closeSubpath:
                if let to = start {
                    length += Line(start: from, end: to).length
                    from = to
                }
                start = nil
            }
        }
        return length
    }
    
    func length(toX x: CGFloat) -> CGFloat {
        var length: CGFloat = 0
        var start: CGPoint?
        var from: CGPoint = .zero
        var isFinished: Bool = false
        
        forEach { element in
            if isFinished {
                return
            }
            switch element {
            case let .move(to: to):
                if to.x > x {
                    isFinished = true
                    return
                }
                if start == nil {
                    start = to
                }
                from = to
            case let .line(to: to):
                if to.x > x {
                    isFinished = true
                    length += Line(start: from, end: to).length(toX: x)
                    return
                }
                length += Line(start: from, end: to).length
                from = to
            case let .quadCurve(to: to, control: control):
                if to.x > x {
                    isFinished = true
                    length += Curve(start: from, end: to, controls: [control]).length(toX: x)
                    return
                }
                length += Curve(start: from, end: to, controls: [control]).length
                from = to
            case let .curve(to: to, control1: control1, control2: control2):
                if to.x > x {
                    isFinished = true
                    length += Curve(start: from, end: to, controls: [control1, control2]).length(toX: x)
                    return
                }
                length += Curve(start: from, end: to, controls: [control1, control2]).length
                from = to
            case .closeSubpath:
                fatalError("Can't include closeSubpath")
            }
        }
        return length
    }
}
