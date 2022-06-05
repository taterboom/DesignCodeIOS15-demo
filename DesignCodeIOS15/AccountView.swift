//
//  AccountView.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/5.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            List {
                VStack(spacing: 8) {
                    Image(systemName: "person.crop.circle.badge.checkmark")
                        .font(.system(size: 32))
                        .foregroundStyle(.blue, .blue.opacity(0.3))
                        .padding()
                        .background(Circle().fill(.thinMaterial))
                        .background(
                            Image(systemName: "hexagon")
                                .symbolVariant(.fill)
                                .font(.system(size: 200))
                                .foregroundColor(.blue)
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
                
                Section {
                    Link(destination: URL(string: "https://www.baidu.com")!) {
                        HStack {
                            Label("Baidu", systemImage: "house")
                            Spacer()
                            Image(systemName: "link")
                        }
                    }
                }
                .foregroundColor(.primary)
                .listRowSeparator(.hidden)
            }
            .listStyle(.insetGrouped)
            .navigationTitle(Text("Account"))
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
