//
//  Weight.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/8.
//

import Foundation

enum WeightRecordSource {
    case health
    case manual
}

struct WeightRecord {
    // Unit gram
    let weight: Int
    
    // Weight date
    let weightDate: Date
    
    // Record created date
    let createdAt: Date
        
    // Source
    let source: WeightRecordSource
    
    // Tags
    let tags: [String]
}
