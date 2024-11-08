//
//  ContentViewViewModel.swift
//  SampleChatApp
//
//  Created by Dineswarareddy on 07/11/24.
//

import Foundation
import SwiftUI
import UIKit

protocol ChatViewModelInterface {
  func appendHumanMessage()
  func appendChatbotMessage()
}

class ChatViewModel: ObservableObject {
  @Published var messages: [MessageModel] = []
  @Published var enteredMessage: String = ""
  @Published var isReplyGenerating: Bool = false
  private var messageToEcho: String = ""
  
  private func appendHumanMessage() {
    appendMessage(message: MessageModel(message: enteredMessage,
                                        sourceOfTheMessage: .fromHuman))
    messageToEcho = enteredMessage
    enteredMessage = ""
  }
  
  private func appendChatbotMessage() {
    appendMessage(message: MessageModel(message: messageToEcho,
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
  
  private func appendMessage(message: MessageModel) {
    withAnimation(.easeIn(duration: 0.5)) {
      messages.append(message)
    }
  }
}
