//
//  ContentView.swift
//  ChatBot
//
//  Created by Dwayne on 22/2/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LazyVStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
