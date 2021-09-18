//
//  ChartData.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/14.
//

import Foundation

struct Point {
    let label: String
    let value: Double
}

class ChartData: ObservableObject, Identifiable {
    let ID = UUID()
    @Published var points: [Point]
    
    init<N: BinaryFloatingPoint & LosslessStringConvertible>(points: [N]) {
        self.points = points.map { Point(label: String($0), value: Double($0)) }
    }
}
