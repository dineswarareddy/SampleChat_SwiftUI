//
//  ErrorHandler.swift
//  SampleChatApp
//
//  Created by Dineswarareddy on 08/11/24.
//

import Foundation

enum NetworkError: Error {
  case failedToCommunicate
  case serverError
}
