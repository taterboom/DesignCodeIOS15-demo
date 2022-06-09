//
//  BlobView.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/6.
//

import SwiftUI

struct BlobView: View {
    @State var appear = false
    
    var body: some View {
        TimelineView(.animation, content: { timeline in
            let now = timeline.date.timeIntervalSinceReferenceDate
            let angle1 = Angle.degrees(now.remainder(dividingBy: 3) * 20)
            let angle2 = Angle.degrees(now.remainder(dividingBy: 6) * 5)
            let v1 = cos(angle1.radians) / 2 + 0.5
            let v2 = cos(angle2.radians) / 2 + 0.5
            Canvas { context, size in
                context.fill(path(in: CGRect(x: 0, y: 0, width: size.width, height: size.height), v1: v1, v2: v2), with: .linearGradient(Gradient(colors: [.red, .blue]), startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: size.width, y: size.height)))
            }
            .frame(width: 240, height: 200)
            .rotationEffect(.degrees(appear ? 360 : 30))
            .animation(.linear(duration: 30).repeatForever(autoreverses: false), value: appear)
        })
        .onAppear() {
            withAnimation {
                appear = true
            }
        }
    }
    
    func path(in rect: CGRect, v1: Double, v2: Double) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.13457*width*v1, y: 0.00369*height*v2))
        path.addCurve(to: CGPoint(x: 0.84305*width*v1, y: 0.23746*height*v2), control1: CGPoint(x: 0.27902*width*v1, y: -0.01593*height*v2), control2: CGPoint(x: 0.74128*width*v1, y: 0.15433*height*v2))
        path.addCurve(to: CGPoint(x: 0.48738*width*v1, y: 0.99524*height*v2), control1: CGPoint(x: 1.14663*width*v1, y: 0.41239*height*v2), control2: CGPoint(x: 0.99449*width*v1, y: 0.86796*height*v2))
        path.addCurve(to: CGPoint(x: 0.04855*width*v1, y: 0.56222*height*v2), control1: CGPoint(x: 0.27069*width*v1, y: 1.02467*height*v2), control2: CGPoint(x: 0.07422*width*v1, y: 0.8308*height*v2))
        path.addCurve(to: CGPoint(x: 0.13457*width*v1, y: 0.00369*height*v2), control1: CGPoint(x: 0.02288*width*v1, y: 0.29363*height*v2), control2: CGPoint(x: -0.08212*width*v1, y: 0.03312*height*v2))
        path.closeSubpath()
        return path
    }
}

struct BlobView_Previews: PreviewProvider {
    static var previews: some View {
        BlobView()
    }
}
