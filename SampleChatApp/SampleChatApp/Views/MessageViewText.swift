//
//  MessageView.swift
//  SampleChatApp
//
//  Created by Dineswarareddy on 07/11/24.
//

import Foundation
import SwiftUI

struct MessageViewText: View {
  var messageModel: MessageUIModel
  var body: some View {
    if messageModel.sourceOfTheMessage == .fromChatbot {
      ChatbotMessageView(message: messageModel.message)
    } else {
      HumanMessageView(message: messageModel.message)
    }
  }
}

fileprivate struct ChatbotMessageView: View {
  var message: String
  var body: some View {
    HStack {
      Text(message)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color(UIColor.chatBackgroundGray()))
        .foregroundStyle(.black)
        .clipShape(
            .rect(
                topLeadingRadius: 20,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 20,
                topTrailingRadius: 20
            )
        )
      Spacer()
    }
  }
}

fileprivate struct HumanMessageView: View {
  var message: String
  var body: some View {
    HStack {
      Spacer()
      Text(message)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color(UIColor.chatBlueColor()))
        .foregroundStyle(.white)
        .clipShape(
            .rect(
                topLeadingRadius: 20,
                bottomLeadingRadius: 20,
                bottomTrailingRadius: 0,
                topTrailingRadius: 20
            )
        )
    }
  }
}

#Preview {
  MessageViewText(messageModel: MessageUIModel(message: "Message 1", sourceOfTheMessage: .fromChatbot))
}
