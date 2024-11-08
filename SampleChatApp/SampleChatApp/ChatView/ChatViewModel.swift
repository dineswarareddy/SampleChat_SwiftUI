//
//  ContentViewViewModel.swift
//  SampleChatApp
//
//  Created by Dineswarareddy on 07/11/24.
//

import Foundation
import SwiftUI
import UIKit

class ChatViewModel: ObservableObject {
  @Published var messages: [MessageUIModel] = []
  @Published var enteredMessage: String = ""
  @Published var isReplyGenerating: Bool = false
  private var messageToEcho: String = ""
  var usecase: ChatViewUsecase
  
  init(usecase: ChatViewUsecase = ChatViewUsecaseImpl()) {
    self.usecase = usecase
  }
  
  private func appendHumanMessage() {
    appendMessage(message: MessageUIModel(message: enteredMessage,
                                        sourceOfTheMessage: .fromHuman))
    messageToEcho = enteredMessage
    enteredMessage = ""
  }
  
  private func appendChatbotMessage() {
    appendMessage(message: MessageUIModel(message: messageToEcho,
                                        sourceOfTheMessage: .fromChatbot))
  }
  
  func sendMessage() {
    if enteredMessage.isEmpty { return }
    appendHumanMessage()
    isReplyGenerating.toggle()
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
      self.isReplyGenerating.toggle()
      self.appendChatbotMessage()
    }
  }
  
  private func appendMessage(message: MessageUIModel) {
    withAnimation(.easeIn(duration: 0.5)) {
      messages.append(message)
    }
  }
  
  // Use this function to load the data from storage or server
  func fetchMessagesIfAny() {
    usecase.fetchConverstationsIfAny { response in
      print("response received, \(response)")
    }
  }
}
