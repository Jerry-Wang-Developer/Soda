//
//  BarChartCell.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/9.
//

import SwiftUI

struct BarChartCell: View {
    var index: Int
    var normalizedValue: Double
    var barColor: Color
    let topText: String
    let bottomText: String
    
    @State private var barHeight: Double = 0
    
    var body: some View {
        VStack {
            Text(topText).lineLimit(1)
            Spacer()
            GeometryReader(content: { geometry in
                let width = geometry.frame(in: .global).width * 0.8
                let height = geometry.frame(in: .global).height * CGFloat(normalizedValue)
                VStack {
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(Color.yellow)
                            .frame(height: CGFloat(barHeight))
                        Rectangle()
                            .fill(Color.blue)
                            .frame(height: CGFloat(barHeight) / 2)
                                                Rectangle()
                            .fill(Color.red)
                            .frame(height: CGFloat(barHeight) / 3)
                    }
                    .frame(width: width)
                    .cornerRadius(5)
                    .onAppear() {
                        self.barHeight = Double(height)
                    }
                    .animation(.spring().delay(Double(index) * 0.05))
                }
            })
            Text(bottomText).lineLimit(1)
        }.font(.caption2)
    }
}

struct BarChartCell_Previews: PreviewProvider {
     static var previews: some View {
        HStack(alignment: .bottom) {
            BarChartCell(index: 0, normalizedValue: 0.3, barColor: .blue, topText: "120.3", bottomText: "五")
                .previewLayout(.sizeThatFits).background(Color.purple)
            Spacer(minLength: 30)
            BarChartCell(index: 1, normalizedValue: 1, barColor: .red, topText: "130.3", bottomText: "六")
                .previewLayout(.sizeThatFits).background(Color.black)
        }.frame(width: 100, height: 300)
     }
 }
