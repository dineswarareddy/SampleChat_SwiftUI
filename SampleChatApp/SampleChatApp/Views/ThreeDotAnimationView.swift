//
//  ThreeDotAnimationView.swift
//  SampleChatApp
//
//  Created by Dineswarareddy on 07/11/24.
//

import SwiftUI

struct ThreeDotAnimationView: View {
  @State var loading = false
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack(spacing: 10) {
        circleView()
        circleView(withDelay: 0.2)
        circleView(withDelay: 0.4)
        Spacer()
      }
    }
    .onAppear() {
      self.loading = true
    }
  }
  
  func circleView(withDelay: TimeInterval = 0.0) -> AnyView {
    return AnyView(Circle()
      .fill(Color(UIColor.chatBackgroundGray()))
      .frame(width: 5, height: 5)
      .scaleEffect(loading ? 1.5 : 0.5)
      .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true).delay(withDelay), value: loading))
  }
}

#Preview {
  ThreeDotAnimationView()
}

