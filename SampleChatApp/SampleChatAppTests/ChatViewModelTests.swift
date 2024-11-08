//
//  ChatViewModelTests.swift
//  SampleChatAppTests
//
//  Created by Dineswarareddy on 08/11/24.
//

import Foundation
import XCTest
@testable import SampleChatApp

final class ChatViewModelTests: XCTestCase {
  var chatViewModel: ChatViewModel!
  var mockUsecase: MockChatUsecase = MockChatUsecase()
  
  override func setUpWithError() throws {
    chatViewModel = ChatViewModel(usecase: mockUsecase)
  }
  
  func testappendChatbotMessage_whenSuccessShared_thenMessagesREceived() {
    mockUsecase.messages = [MessageUIModel(message: "tested", sourceOfTheMessage: .fromHuman)]
    chatViewModel.fetchMessagesIfAny()
  }
}
