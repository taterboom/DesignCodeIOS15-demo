//
//  ContentView.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/4.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("activeIndex") var activeIndex = 0
    
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
            TabBar()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
