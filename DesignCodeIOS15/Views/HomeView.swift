//
//  HomeView.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/9.
//

import SwiftUI

struct HomeView: View {
    @Namespace var ns
    @State private var hasScroll: Bool = false
    @State private var activeTabIndex: Int = 1
    @State private var courseHide = true
    @State private var statusBarHide = false
    @EnvironmentObject var model: Model
    
    var body: some View {
        ScrollView {
            geometryDetaction
            swiper
            CourseItem(ns: ns)
                .onTapGesture {
                    withAnimation {
                        courseHide = false
                        model.showDetail = true
                    }
                }
        }
        .coordinateSpace(name: "scrollParent")
        .safeAreaInset(edge: .top) {
            Color.clear.frame(maxWidth: .infinity, maxHeight: 70)
        }
        .overlay {
            NavigationBar(title: "Featured", hasScroll: $hasScroll)
        }
        .statusBar(hidden: statusBarHide)
        .onChange(of: courseHide) { newValue in
            withAnimation {
                statusBarHide = !newValue
                model.showDetail = !newValue
            }
        }
        
        if !courseHide {
            CourseView(ns: ns, hide: $courseHide)
                .zIndex(1)
        }
    }
    
    var geometryDetaction: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: geometry.frame(in: .named("scrollParent")).minY)
        }
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation {
                hasScroll = value < 0
            }
        })
    }
    
    var swiper: some View {
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
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Model())
    }
}
