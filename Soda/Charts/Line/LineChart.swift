//
//  Line.swift
//  Soda
//
//  Created by Jerrywang on 2021/9/14.
//

import SwiftUI

struct LineChart: View {
    @ObservedObject var data: ChartData
    
    @State private var showFull: Bool = false
    @Binding var showIndicator: Bool
    @Binding var touchLocation: CGPoint
    
    var body: some View {
        GeometryReader(content: { geometry in
            let frame = geometry.frame(in: .local)
            let linearGradient = LinearGradient(gradient: Gradient(colors: [Color(hex: 0x7B75FF), Color(hex: 0x6FEAFF)]), startPoint: .leading, endPoint: .trailing)
            let linearGradient2 = LinearGradient(gradient: Gradient(colors: [Color(hex: 0xC2E8FF), Color.white]), startPoint: .bottom, endPoint: .top)
            let strokeStyle = StrokeStyle(lineWidth: 5, lineJoin: .round)
            let animation = Animation.easeOut(duration: 1.2)
            let path = path(in: frame)
            let closedPath = closedPath(in: frame)
                
            ZStack {
                closedPath
                    .fill(linearGradient2)
                    .rotationEffect(.degrees(180), anchor: .center)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                
                path
                    .trim(from: 0, to: showFull ? 1 : 0)
                    .stroke(linearGradient, style: strokeStyle)
                    .rotationEffect(.degrees(180), anchor: .center)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .animation(animation)
                    .onAppear {
                        showFull = true
                    }
                    .onDisappear {
                        showFull = false
                    }
                
                if showIndicator {
                    IndicatorPoint()
                        .frame(width: 14, height: 14)
                        .position(path.point(ofX: touchLocation.x))
                        .rotationEffect(.degrees(180), anchor: .center)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                }
            }
        })
    }
    
    private func closedPath(in frame: CGRect) -> Path {
        let points = data.points.map(\.value)
        let step = step(in: frame)
        return Path.quadClosedCurvedPath(withPoints: points, step: step)
    }
    
    private func path(in frame: CGRect) -> Path {
        let points = data.points.map(\.value)
        let step = step(in: frame)
        return Path.quadCurvedPath(withPoints: points, step: step)
    }
    
    private func step(in frame: CGRect) -> CGPoint {
        let width = stepWidth(in: frame)
        let height = stepHeight(in: frame)
        return CGPoint(x: width, y: height)
    }
    
    private func stepWidth(in frame: CGRect) -> CGFloat {
        if data.points.count < 2 {
            return 0
        } else {
            return frame.size.width / CGFloat(data.points.count - 1)
        }
    }
    
    private func stepHeight(in frame: CGRect) -> CGFloat {
        let points = data.points.map(\.value)
        guard let min = points.min(),
              let max = points.max(),
              max > min else {
            return 0
        }
        return frame.size.height / CGFloat(max - min)
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Group {
                GeometryReader{ geometry in
                    LineChart(data: ChartData(points: [12,-230,10,54]), showIndicator: .constant(true), touchLocation: .constant(CGPoint(x: 100, y: 12)))
                }.frame(width: 320, height: 160)
                GeometryReader{ geometry in
                    LineChart(data: ChartData(points: [12,-230,10,54]), showIndicator: .constant(true), touchLocation: .constant(CGPoint(x: 100, y: 12)))
                }.frame(width: 320, height: 160)
            }
        }
    }
}
