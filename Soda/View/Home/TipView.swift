//
//  TipView.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/17.
//

import SwiftUI

struct TipView: View {
    let date: String = "SEP 4th, 2021"
    let tip: String = "可能的话，最好在明亮些的地方见，季节但愿是夏天。"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(date)
                .font(.caption)
            Text(tip)
        }.padding()
    }
}

struct TipView_Previews: PreviewProvider {
    static var previews: some View {
        TipView()
    }
}

