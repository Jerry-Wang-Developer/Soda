//
//  Bezier.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/16.
//

import CoreGraphics

// Refer: https://juejin.cn/post/6844903666361565191
// 0 < t < 1
func bezier(points: [CGFloat], t: CGFloat) -> CGFloat {
    var result: CGFloat = 0.0
    let n = points.count - 1
    
    for i in 0...n {
        let p = points[i]
        let c = factorial(n) / (factorial(n - i) * factorial(i))
        let b = CGFloat(c) * pow(1 - t, CGFloat(n - i)) * pow(t, CGFloat(i))
        result += p * b
    }
    return result
}
