//
//  HomeView.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/9.
//

import SwiftUI

struct HomeView: View {
    @State private var hasScroll: Bool = false
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                Color.clear.preference(key: ScrollPreferenceKey.self, value: geometry.frame(in: .named("scrollParent")).minY)
            }
            FeatureItem()
        }
        .coordinateSpace(name: "scrollParent")
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation {
                hasScroll = value < 0
            }
        })
        .safeAreaInset(edge: .top) {
            Color.clear.frame(maxWidth: .infinity, maxHeight: 70)
        }
        .overlay {
            NavigationBar(title: "Featured", hasScroll: $hasScroll)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
