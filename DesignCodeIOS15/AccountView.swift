//
//  AccountView.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/5.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    
    var body: some View {
        NavigationView {
            List {
                profile
                menu
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle(Text("Account"))
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .font(.system(size: 32))
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.thinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
            Text("Tater Bomb")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                Text("China")
            }
            .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            BlobView()
                .offset(x: 240, y: -50)
                .scaleEffect(0.7)
        )
    }
    
    var menu: some View {
        Section {
            NavigationLink(destination: ContentView()) {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink { Text("Billing") } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink { Text("Help") } label: {
                Label("Help", systemImage: "questionmark")
            }
        }
        .foregroundColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            Group {
                if !isDeleted {
                    Link(destination: URL(string: "https://www.baidu.com")!) {
                        HStack {
                            Label("Baidu", systemImage: "house")
                            Spacer()
                            Image(systemName: "link")
                        }
                    }
                    .transition(.opacity)
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button {
                            isDeleted = true
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        .tint(.red)
                    }
                }
            }
            .animation(.easeInOut, value: isDeleted)
        }
        .foregroundColor(.primary)
        .listRowSeparator(.hidden)
    }
    
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
