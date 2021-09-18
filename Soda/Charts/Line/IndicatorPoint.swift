//
//  IndicatorPoint.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/15.
//

import SwiftUI

struct IndicatorPoint: View {
    var body: some View {
        GeometryReader(content: { geometry in
            let frame = geometry.frame(in: .global)
            ZStack {
                Circle()
                    .fill(Color(hex: 0xFF57A6))
                Circle()
                    .stroke(Color.white, style: StrokeStyle(lineWidth: frame.width / 3.5))
            }
            .shadow(color: Color(hex: 0xE8E7EA), radius: frame.width / 2.5, x: 0, y: frame.width / 2.5)
        })
        
    }
}

struct IndicatorPoint_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorPoint()
            .frame(width: 50, height: 50, alignment: .center)
    }
}

