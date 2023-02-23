//
//  ChatBotView.swift
//  ChatBot
//
//  Created by Dwayne on 22/2/2023.
//

import SwiftUI
import Combine

struct ChatBotView: View {
    @State private var chatMessages: [ChatMessage] = []
    @State private var messageText: String = ""
    let openAiService = OpenAiService()
    @State var cancellables:  Set<AnyCancellable> = []
    
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
                    sendMessage()
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
        let myMessage = ChatMessage(id: UUID().uuidString, content: messageText, date: Date(), sender: .user)
        chatMessages.append(myMessage)
        
        openAiService.sendMessage(message: messageText).sink { completion in
            
        } receiveValue: { response in
            guard let textResponse = response.choice.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) else { return }
            let botMessage = ChatMessage(id: response.id, content: textResponse, date: Date(), sender: .bot )
            chatMessages.append(botMessage)
        }
        .store(in: &cancellables)

        messageText = ""
    }
}

struct ChatBotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBotView()
    }
}
