//
//  ChatViewUsecase.swift
//  SampleChatApp
//
//  Created by Dineswarareddy on 08/11/24.
//

import Foundation

protocol ChatViewUsecase {
  func fetchConverstationsIfAny(completionHander: @escaping(Result<[MessageUIModel], Error>) -> ())
}

class ChatViewUsecaseImpl: ChatViewUsecase {
  var repo: ChatViewRepo = ChatViewRepoImpl()
  
  func fetchConverstationsIfAny(completionHander: @escaping (Result<[MessageUIModel], any Error>) -> ()) {
    repo.fetchConverstation(completionHandler: completionHander)
  }
}
