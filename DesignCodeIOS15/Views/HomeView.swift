//
//  HomeView.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/9.
//

import SwiftUI

struct HomeView: View {
    @State private var hasScroll: Bool = false
    @State private var activeTabIndex: Int = 1
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                Color.clear.preference(key: ScrollPreferenceKey.self, value: geometry.frame(in: .named("scrollParent")).minY)
            }
            TabView(selection: $activeTabIndex) {
                ForEach(0..<4) {index in
                    GeometryReader(content: { geomtry in
                        let minX = geomtry.frame(in: .global).minX
                        
                        FeatureItem(index: index, overlayOffestX: minX / 4)
                            .padding(.vertical, 40)
                            .rotation3DEffect(.degrees(-minX / 20), axis: (x: 0, y: 1, z: 0))
                            .blur(radius: abs(minX / 70))
                            .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                    })
                }
            }
            .frame(height: 430)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .background(Image("Blob 1").offset(x: 200, y: -100))
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
