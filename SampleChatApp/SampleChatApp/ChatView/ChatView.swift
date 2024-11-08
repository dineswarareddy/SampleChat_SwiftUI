//
//  ChatView.swift
//  SampleChatApp
//
//  Created by Dineswarareddy on 07/11/24.
//

import SwiftUI

struct ChatView: View {
  @ObservedObject var viewModel = ChatViewModel()
  private let loadIndicatorId = "loading_indicator"
  var body: some View {
    VStack {
      Text("Message Time")
        .foregroundStyle(Color(UIColor.lightGray))
      ScrollViewReader { scrollInstance in
        List {
          ForEach(viewModel.messages, id: \.id) { eachMessage in
            if eachMessage.messageType == .text {
              MessageViewText(messageModel: eachMessage)
                .listRowSeparator(.hidden)
                .id(eachMessage.id)
            } else {
              // Handle message views based on the model type
            }
          }
          if viewModel.isReplyGenerating {
            ThreeDotAnimationView()
              .listRowSeparator(.hidden)
              .id(loadIndicatorId)
          }
        }
        .listStyle(.plain)
        .listRowSpacing(-12)
        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        .onChange(of: viewModel.messages.count) {
          scrollInstance.scrollTo(viewModel.messages.last?.id, anchor: .bottom)
        }
        .onChange(of: viewModel.isReplyGenerating) {
          if viewModel.isReplyGenerating {
            scrollInstance.scrollTo(loadIndicatorId, anchor: .bottom)
          }
        }
      }
      SendMessageView(enteredMessage: $viewModel.enteredMessage, sendMessageAction:
                        withAnimation(.bouncy, {
        sendMessageButtonAction
      }))
    }
  }
  
  func sendMessageButtonAction() {
    viewModel.sendMessage()
  }
}

#Preview {
  ChatView()
}
