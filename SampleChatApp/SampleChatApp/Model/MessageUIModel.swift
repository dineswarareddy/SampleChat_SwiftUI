//
//  MessageUIModel.swift
//  SampleChatApp
//
//  Created by Dineswarareddy on 07/11/24.
//

import Foundation

enum SourceOfMessage {
  case fromHuman
  case fromChatbot
}

enum MessageType: Hashable {
  case text
  case image(imageUrl: String)
  case video(videoUrl: String)
}

struct MessageUIModel: Identifiable, Hashable, Equatable {
  internal init(message: String,
                sourceOfTheMessage: SourceOfMessage,
                type: MessageType = .text) {
    self.message = message
    self.sourceOfTheMessage = sourceOfTheMessage
    self.messageType = type
  }

  let id: String = UUID().uuidString
  let message: String
  let sourceOfTheMessage: SourceOfMessage
  let messageType: MessageType
}
