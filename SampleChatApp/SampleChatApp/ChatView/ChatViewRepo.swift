//
//  ChatViewRepo.swift
//  SampleChatApp
//
//  Created by Dineswarareddy on 08/11/24.
//

import Foundation

protocol ChatViewRepo {
  func fetchConverstation(completionHandler: @escaping (Result<[MessageUIModel], Error>) -> ())
}

class ChatViewRepoImpl: ChatViewRepo {
  var service: MessagesDataService?
  
  init(service: MessagesDataService? = MessagesDataServiceImpl()) {
    self.service = service
  }
  
  func fetchConverstation(completionHandler: @escaping (Result<[MessageUIModel], any Error>) -> ()) {
    // Write a mapper here to convert server object to UI object
    service?.loadMessages { response in
      switch response {
      case .success(_):
        completionHandler(.success([MessageUIModel(message: "sample", sourceOfTheMessage: .fromHuman)]))
      case .failure(_):
        completionHandler(.failure(NetworkError.serverError))
      }
    }
  }
}

