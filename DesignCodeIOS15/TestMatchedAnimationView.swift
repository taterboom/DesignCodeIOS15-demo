//
//  TestMatchedAnimationView.swift
//  DesignCodeIOS15
//
//  Created by 薛勇 on 2022/6/12.
//

import SwiftUI

struct TestMatchedAnimationView: View {
    @Namespace var ns
    @State var hide: Bool = false
    
    var body: some View {
        Group {
            if hide {
                Text("Happy")
                    .matchedGeometryEffect(id: "text", in: ns)
                    .frame(maxWidth:.infinity, alignment: .leading)
            } else {
                Text("Happy")
                    .matchedGeometryEffect(id: "text", in: ns)
                    .frame(maxWidth:.infinity, alignment: .trailing)
            }
        }
        .onTapGesture {
            withAnimation {
                hide.toggle()
            }
        }
    }
}

struct TestMatchedAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TestMatchedAnimationView()
    }
}
