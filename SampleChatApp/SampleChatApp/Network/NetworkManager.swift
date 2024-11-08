//
//  NetworkManager.swift
//  SampleChatApp
//
//  Created by Dineswarareddy on 08/11/24.
//

import Foundation

protocol NetworkManager {
  func fetchMessagesFromServer(completion: @escaping (Result<Data, Error>) -> ())
}

// This class responsiblity is to communicate with API and give data
class NetworkManagerImpl: NetworkManager {
  func fetchMessagesFromServer(completion: @escaping (Result<Data, any Error>) -> ()) {
    // Write logic to communicate to server and return data/error to corresponding service layer
  }
}
