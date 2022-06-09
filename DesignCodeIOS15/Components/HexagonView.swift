//
//  HexagonView.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/6.
//

import SwiftUI

struct HexagonView: View {
    var body: some View {
        Canvas { context, size in
            context.draw(Text("Hello"), at: CGPoint(x: 20, y: 10))
            context.draw(Image(systemName: "hexagon.fill"), in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
        .frame(width: 200, height: 212)
        .foregroundStyle(.linearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct Hexagon_Previews: PreviewProvider {
    static var previews: some View {
        HexagonView()
    }
}
