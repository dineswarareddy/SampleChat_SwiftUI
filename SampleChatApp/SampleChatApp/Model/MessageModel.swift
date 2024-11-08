//
//  MessageModel.swift
//  SampleChatApp
//
//  Created by Dineswarareddy on 07/11/24.
//

import Foundation

enum SourceOfMessage {
  case fromHuman
  case fromChatbot
}

struct MessageModel: Identifiable, Hashable {
  internal init(message: String,
                sourceOfTheMessage: SourceOfMessage) {
    self.message = message
    self.sourceOfTheMessage = sourceOfTheMessage
  }
  let id: String = UUID().uuidString
  let message: String
  let sourceOfTheMessage: SourceOfMessage
}
