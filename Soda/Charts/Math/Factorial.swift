//
//  Factorial.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/16.
//

import Foundation

func factorial(_ number: Int) -> Int {
    if number == 0 {
        return 1
    } else {
        return number * factorial(number - 1)
    }
}

