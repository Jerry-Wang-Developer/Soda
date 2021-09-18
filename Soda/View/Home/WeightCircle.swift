//
//  WeightCircle.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/17.
//

import SwiftUI

struct WeightCircle: View {
    let linearGradient = LinearGradient(gradient: Gradient(colors: [Color(hex: 0x7B75FF), Color(hex: 0x6FEAFF)]), startPoint: .leading, endPoint: .trailing)

    var body: some View {
        ZStack {
            Circle()
                .scale(0.7)
                .shadow(color: .black, radius: 45, x: 0, y: 10)
            Circle()
                .fill(linearGradient)
            
            VStack {
                Text("148.2斤")
                Text("累计减重 2.3")
            }.font(.caption)
        }
    }
}

struct WeightCircle_Previews: PreviewProvider {
    static var previews: some View {
        WeightCircle()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}

