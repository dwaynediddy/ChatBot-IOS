//
//  ChatBotView.swift
//  ChatBot
//
//  Created by Dwayne on 22/2/2023.
//

import SwiftUI

struct ChatBotView: View {
    @State var chatMessages: [ChatMessage] = []
    var body: some View {
        ScrollView {
            LazyVStack {
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

struct ChatBotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBotView()
    }
}
