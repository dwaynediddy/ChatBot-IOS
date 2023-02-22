//
//  ChatBotModel.swift
//  ChatBot
//
//  Created by Dwayne on 22/2/2023.
//

import Foundation

struct ChatMessage {
    let id: String
    let content: String
    let date: Date
    let sender: MessageSender
}
enum MessageSender {
    case user
    case bot
}

extension ChatMessage {
    static let sampleMessage = [
        ChatMessage(id: UUID().uuidString, content: "Sample message from user", date: Date(), sender: .user),
        ChatMessage(id: UUID().uuidString, content: "Sample message from bot", date: Date(), sender: .bot),
        ChatMessage(id: UUID().uuidString, content: "Sample message from user1", date: Date(), sender: .user),
        ChatMessage(id: UUID().uuidString, content: "Sample message from bot2", date: Date(), sender: .bot),
        ChatMessage(id: UUID().uuidString, content: "Sample message from user3", date: Date(), sender: .user),
        ChatMessage(id: UUID().uuidString, content: "Sample message from bot4", date: Date(), sender: .bot)
    ]
}

