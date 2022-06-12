//
//  CourseItem.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/12.
//

import SwiftUI

struct CourseItem: View {
    var ns: Namespace.ID
    
    var body: some View {
        ZStack {
            Image("Background 1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .mask(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .matchedGeometryEffect(id: "bg", in: ns)
                .overlay {
                    VStack(alignment: .leading, spacing: 8) {
                        Spacer()
                        Text("Flutter for iOS 15")
                            .font(.largeTitle.weight(.bold))
                            .foregroundStyle(.white)
                        Text("20 sections - 3 hours".uppercased())
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("Build an Flutter app for iOS 15 with custom layouts, animations and ...")
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                    }
                    .padding(20)
                    .matchedGeometryEffect(id: "info", in: ns)
                }
        }
        .strokeStyle()
        .padding(.horizontal, 20)
    }
}

struct CourseItem_Previews: PreviewProvider {
    @Namespace static var ns
    static var previews: some View {
        CourseItem(ns: ns)
    }
}
