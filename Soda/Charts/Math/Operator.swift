//
//  Operator.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/16.
//

import CoreGraphics

precedencegroup ExponentialPrecedence {
    lowerThan: BitwiseShiftPrecedence
    higherThan: MultiplicationPrecedence
    associativity: right
}

infix operator ^: ExponentialPrecedence

func ^ (base: Double, power: Double) -> Double
{
    return pow(base, power)
}

func ^ (base: CGFloat, power: CGFloat) -> CGFloat
{
    return pow(base, power)
}
