//
//  Styles.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/4.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    var cornerRadius: CGFloat
    
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(.linearGradient(colors: [
                    .white.opacity(colorScheme == .dark ? 0.3 : 0.6),
                    .black.opacity(0.1)
                ], startPoint: .top, endPoint: .bottom))
                .blendMode(.overlay)
        )
    }
}

extension View {
    func strokeStyle(cornerRadius: CGFloat = 16.0) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}
