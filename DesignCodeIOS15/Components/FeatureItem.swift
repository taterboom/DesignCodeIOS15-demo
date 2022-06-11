//
//  FeatureItem.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/9.
//

import SwiftUI

struct FeatureItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            HStack(spacing: -8.0) {
                Image(/*@START_MENU_TOKEN@*/"Logo 2"/*@END_MENU_TOKEN@*/)
                    .resizable(resizingMode: .stretch)
                    .cornerRadius(8)
                    .padding(10)
                    .frame(width: 44, height: 44)
                    .background(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .strokeStyle()
                    .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                Image("Logo 3")
                    .resizable(resizingMode: .stretch)
                    .cornerRadius(8)
                    .padding(10)
                    .frame(width: 44, height: 44)
                    .background(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .strokeStyle()
                    .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
            }
            Text("SwiftUI for iOS 15")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [Color.red, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text("20 sections - 3 hours".uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(height: 350)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
        .strokeStyle()
        .padding(.horizontal, 20)
        .background(Image("Blob 1").offset(x: 200, y: -100))
        .overlay(Image("Illustration 5").resizable().aspectRatio(contentMode: .fit).offset(x: 40, y: -100))
    }
}

struct FeatureItem_Previews: PreviewProvider {
    static var previews: some View {
        FeatureItem()
    }
}
