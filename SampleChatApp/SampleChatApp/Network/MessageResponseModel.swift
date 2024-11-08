//
//  MessageResponseModel.swift
//  SampleChatApp
//
//  Created by Dineswarareddy on 08/11/24.
//

import Foundation

struct MessageResponseModel: Codable {
  let message: String
  let type: String
  let createdAt: String
}
