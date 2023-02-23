//
//  ChatBotView.swift
//  ChatBot
//
//  Created by Dwayne on 22/2/2023.
//

import SwiftUI

struct ChatBotView: View {
    @State private var chatMessages: [ChatMessage] = ChatMessage.sampleMessage
    @State private var messageText: String = ""
    let openAiService = OpenAiService()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(chatMessages, id: \.id) { message in
                        messageView(message: message)
                    }
                }
            }
            HStack {
                TextField("Enter a message", text: $messageText)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(12)
                Button {
                    
                } label: {
                    Text("Send")
                        .foregroundColor(.white)
                        .padding()
                        .background(.black)
                        .cornerRadius(12)
                }
            }
        }
        .padding()
        .onAppear {
            openAiService.sendMessage(message: "create a coffee catch phrase")
        }
    }
    func messageView(message: ChatMessage) -> some View {
        HStack {
            if message.sender == .user { Spacer()}
            Text(message.content)
                .foregroundColor(message.sender == .user ? .white : .black)
                .padding()
                .background(message.sender == .user ? .blue : .gray.opacity(0.1))
            .cornerRadius(16)
            if message.sender == .bot { Spacer()}
        }
    }
    func sendMessage() {
        messageText = ""
        print(messageText)
    }
}

struct ChatBotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBotView()
    }
}
