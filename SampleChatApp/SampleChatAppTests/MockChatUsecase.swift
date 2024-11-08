//
//  MockChatUsecase.swift
//  SampleChatAppTests
//
//  Created by Dineswarareddy on 08/11/24.
//

import Foundation
@testable import SampleChatApp

class MockChatUsecase: ChatViewUsecase {
  var error: Error?
  var messages: [MessageUIModel]?
  
  func fetchConverstationsIfAny(completionHander: @escaping (Result<[SampleChatApp.MessageUIModel], any Error>) -> ()) {
    if let errorReceived = error {
      completionHander(.failure(errorReceived))
    } else if let messagesReceived = messages {
      completionHander(.success(messagesReceived))
    }
  }
}
