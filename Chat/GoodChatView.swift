//
//  ContentView.swift
//  Chat
//
//  Created by Vincent on 20/05/2024.
//

import SwiftUI

struct GoodChatView: View {
    
    @State var data = (0...20).map { $0 }
    
    var body: some View {
        ScrollViewReader { scrollView in
            List(data, id: \.self) { int in
                ChatMessage(text: "\(int)")
                    .flippedUpsideDown()
                    .listRowSeparator(.hidden)
                    .id(int)
                    .onAppear {
                        if int == data.last {
                            loadMoreData()
                        }
                    }
            }
            .listStyle(.plain)
            .flippedUpsideDown()
            .onAppear {
                scrollView.scrollTo(data.first!)
            }
        }
    }
    
    func loadMoreData() {
        guard data.count < 40 else { return }
        
        let additionalData = (21...40).map { $0 }
        
        data.append(contentsOf: additionalData)
    }
}

struct FlippedUpsideDown: ViewModifier {
    func body(content: Content) -> some View {
        content
            .rotationEffect(.radians(Double.pi))
            .scaleEffect(x: -1, y: 1, anchor: .center)
    }
}

extension View {
    func flippedUpsideDown() -> some View {
        modifier(FlippedUpsideDown())
    }
}

#Preview {
    BadChatView()
}
