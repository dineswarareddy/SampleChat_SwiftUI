//
//  RestClient.swift
//  SampleChatApp
//
//  Created by Dineswarareddy on 08/11/24.
//

import Foundation

class RestClient {
  func fetchMessages(completionHandler: @escaping (Result<Data, Error>) -> Void) {
      let url = URL(string: "url")!

      let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        if let error = error {
          print("Error with fetching message: \(error)")
          completionHandler(.failure(error))
          return
        }

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
          print("Error with the response, unexpected status code: \(response)")
          return
        }

        if let data = data {
          completionHandler(.success(data))
        }
      })
      task.resume()
    }
}
