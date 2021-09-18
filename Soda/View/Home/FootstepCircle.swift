//
//  FootstepCircle.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/17.
//

import SwiftUI

struct FootstepCircle: View {
    let linearGradient = LinearGradient(gradient: Gradient(colors: [Color(hex: 0x7B75FF), Color(hex: 0x6FEAFF)]), startPoint: .leading, endPoint: .trailing)

    var body: some View {
        ZStack {
            Circle()
                .fill(linearGradient)
            
            VStack {
                Image("")
                Text("4002")
                Text("目标8000步")
            }.font(.caption)
        }
    }
}

struct FootstepCircle_Previews: PreviewProvider {
    static var previews: some View {
        FootstepCircle()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}

