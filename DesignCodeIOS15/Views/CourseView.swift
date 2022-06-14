//
//  CourseView.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/12.
//

import SwiftUI

struct CourseView: View {
    var ns: Namespace.ID
    @Binding var hide: Bool
    @State var showOrder = [false]
    
    var body: some View {
        ScrollView {
            ZStack {
                closeButton
                cover
            }
            content
                .offset(y: 120)
        }
        .ignoresSafeArea()
        .background(Color("Background"))
        .onAppear() {
            withAnimation(.easeInOut.delay(0.2)) {
                showOrder[0] = true
            }
        }
        .onChange(of: hide) { newValue in
            if (newValue) {
                showOrder[0] = false
            }
        }
    }
    
    var cover: some View {
        Group {
            Image("Background 1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .mask(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .matchedGeometryEffect(id: "bg", in: ns)
            VStack(alignment: .leading, spacing: 8) {
                Text("Flutter for iOS 15")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.primary)
                Text("20 sections - 3 hours".uppercased())
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Text("Build an Flutter app for iOS 15 with custom layouts, animations and ...")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.secondary)
            }
            .padding(20)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
            .offset(y: 200)
            .padding(20)
            .matchedGeometryEffect(id: "info", in: ns)
        }
    }
    
    var closeButton: some View {
        Image(systemName: "xmark")
            .zIndex(1)
            .padding(12)
            .background(.ultraThinMaterial, in: Circle())
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .onTapGesture {
                withAnimation {
                    hide = true
                }
            }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("I'm content")
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .opacity(showOrder[0] ? 1 : 0)
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var ns
    static var previews: some View {
        CourseView(ns: ns, hide: .constant(false))
    }
}
