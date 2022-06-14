//
//  DesignCodeIOS15App.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/4.
//

import SwiftUI

@main
struct DesignCodeIOS15App: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
