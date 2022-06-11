//
//  NavigationBar.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/9.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    @Binding var hasScroll: Bool
    
    var body: some View {
        ZStack {
            if hasScroll {
                Color.clear
                    .background(.ultraThinMaterial)
                    .blur(radius: 8)
            }
            HStack {
                Text(title)
                    .animatableFont(size: hasScroll ? 22 : 36, weight: .bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Image(systemName: "magnifyingglass")
                    .frame(width: 36, height: 36)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .strokeStyle(cornerRadius: 8)
                Image("Avatar Default")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .frame(width: 26, height: 26)
                    .padding(5)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .strokeStyle(cornerRadius: 8)
            }
            .padding(.horizontal, 20)
        }
        .frame(height: hasScroll ? 48 : 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Feature", hasScroll: .constant(false))
    }
}
