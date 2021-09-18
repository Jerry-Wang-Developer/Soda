//
//  DataBoard.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/17.
//

import SwiftUI

struct DataBoard: View {
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                WeightCircle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .offset(x: -50.0, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                FootstepCircle()
                    .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                WaterCircle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            }
        })
    }
}


struct DataBoard_Previews: PreviewProvider {
    static var previews: some View {
        DataBoard()
            .frame(width: 300, height: 300)
            .background(Color.red)
    }
}
