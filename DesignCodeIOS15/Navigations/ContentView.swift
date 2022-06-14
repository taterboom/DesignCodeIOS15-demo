//
//  ContentView.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/4.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("activeIndex") var activeIndex = 0
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            Group {
                switch activeIndex {
                case 0: HomeView()
                case 1: AccountView()
                case 2: Text("Hello, World3!")
                default:
                    Text("Where am I!")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(maxWidth: .infinity, maxHeight: 44)
            }
            TabBar()
                .offset(y: model.showDetail ? 100 : 0)
                .opacity(model.showDetail ? 0 : 1)
            Text("showd\(String(model.showDetail))")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model())
            
    }
}
