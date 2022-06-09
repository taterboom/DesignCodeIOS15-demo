//
//  HomeView.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/9.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            FeatureItem()
        }
        .overlay {
            NavigationBar(title: "Featured")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
