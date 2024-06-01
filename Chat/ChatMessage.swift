//
//  ChatMessage.swift
//  Chat
//
//  Created by Vincent on 01/06/2024.
//

import SwiftUI

struct ChatMessage: View {
    
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundStyle(.white)
                .padding()
                .background(.blue)
                .clipShape(
                    RoundedRectangle(cornerRadius: 16)
                )
                .overlay(alignment: .bottomLeading) {
                    Image(systemName: "arrowtriangle.down.fill")
                        .font(.title)
                        .rotationEffect(.degrees(45))
                        .offset(x: -10, y: 10)
                        .foregroundStyle(.blue)
                }
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    ChatMessage(text: "Hello, World!")
}
