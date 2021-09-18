//
//  ContentView.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/8.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        Text("Hello, world!")
//            .padding()
//    }
//}
struct ContentView : View {
    
    @State var isPresented = false //表示是否打开modal窗口

    var modalView: some View { //模态窗口在本质上是一个视图，所以这里定义了一个遵循View协议的结构体，作为需要打开的模态窗口
        Text("The Modal View")
            .font(.system(size: 48))
            .bold()
    }

    var body: some View {
        Button("Show Modal View") {
            self.isPresented = true
        }.sheet(isPresented: $isPresented, content: {
            self.modalView //将创建的自定义视图作为模态窗口的内容
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
