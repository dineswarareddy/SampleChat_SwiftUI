//
//  SendMessageView.swift
//  SampleChatApp
//
//  Created by Dineswarareddy on 07/11/24.
//

import SwiftUI

struct SendMessageView: View {
  @Binding var enteredMessage: String
  var sendMessageAction: () -> ()
  
    var body: some View {
      VStack {
        Rectangle().frame(height: 0.5)
          .background(.gray)
        HStack {
          TextField("Type here", text: $enteredMessage)
          Button {
            print("add attachment action")
          } label: {
            Image(systemName: "paperclip")
          }
          .frame(width: 30, height: 30)
          
          Button {
            print("Send button action")
            sendMessageAction()
          } label: {
            Image(systemName: "paperplane.fill")
          }
          .frame(width: 30, height: 30)
          
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
      }
    }
}

#Preview {
  SendMessageView(enteredMessage: .constant("Message"), sendMessageAction: {
    
  })
}
