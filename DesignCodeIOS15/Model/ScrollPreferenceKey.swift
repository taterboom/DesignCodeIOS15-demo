//
//  ScrollPreferenceKey.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/11.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
