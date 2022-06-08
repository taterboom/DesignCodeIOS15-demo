//
//  TabBar.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/7.
//

import SwiftUI

struct TabBar: View {
    var tabs: [TabItem] = [
        TabItem(icon: "house", name: "Home"),
        TabItem(icon: "lasso", name: "Discover"),
        TabItem(icon: "person", name: "Mine")
    ]
    @State var activeIndex = 0
    @State var tabItemRects: [UUID:TabItemPreferenceKey.TabItemPreferenceKeyValue] = [:]
    
    var body: some View {
        ZStack {
            Group {
                switch activeIndex {
                case 0: Text("Hello, World1!")
                case 1: Text("Hello, World2!")
                case 2: Text("Hello, World3!")
                default:
                    Text("Where am I!")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack {
                ForEach(tabs.indices, id: \.self) { tabIndex in
                    GeometryReader { geometry in
                        VStack {
                            Image(systemName: tabs[tabIndex].icon)
                            Text(tabs[tabIndex].name)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .preference(key: TabItemPreferenceKey.self, value: [tabs[tabIndex].id:TabItemPreferenceKey.TabItemPreferenceKeyValue(id: tabs[tabIndex].id, rect: geometry.frame(in: .global))])
                        .onTapGesture {
                            activeIndex = tabIndex
                        }
                    }
                }
            }
            .frame(height: 80)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 32, style: .continuous))
            .background(
                Circle()
                    .fill(.red)
                    .frame(width: 40, height: 40)
                    .offset(x: (tabItemRects[tabs[activeIndex].id]?.rect.midX  ?? 0) - 20)
                    .animation(.spring(response: 0.2, dampingFraction: 0.6), value: activeIndex),
                alignment: .leading
            )
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .onPreferenceChange(TabItemPreferenceKey.self) { pks in
                tabItemRects = pks
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct TabItem: Identifiable {
    var id = UUID()
    var icon: String
    var name: String
}

struct TabItemPreferenceKey: PreferenceKey {
    struct TabItemPreferenceKeyValue: Equatable {
        var id: UUID
        var rect: CGRect
    }
    
    static func reduce(value: inout [UUID:TabItemPreferenceKeyValue], nextValue: () -> [UUID:TabItemPreferenceKeyValue]) {
        value.merge(nextValue()) { a, b in
            b
        }
    }
    
    static var defaultValue: [UUID:TabItemPreferenceKeyValue] = [:]
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
        }
    }
}
