//
//  DataHandler.swift
//  SampleChatApp
//
//  Created by Dineswarareddy on 08/11/24.
//

import Foundation

protocol MessagesDataService {
  func loadMessages(completionHandler: @escaping (Result<[MessageResponseModel], Error>) -> ())
}

// This class responsibility is to fetch data from server or database
class MessagesDataServiceImpl: MessagesDataService {
  var networkManager: NetworkManager?
  init(networkManager: NetworkManager = NetworkManagerImpl()) {
    self.networkManager = networkManager
  }
  
  func loadMessages(completionHandler: @escaping (Result<[MessageResponseModel], any Error>) -> ()) {
    networkManager?.fetchMessagesFromServer(completion: { response in
      // Handler response here with error and response handling with data parsing

      //    let messagesList = try? JSONDecoder().decode(MessageResponseModel.self, from: data) {
      //    completionHandler(.success(messagesList))
    })
  }
}
