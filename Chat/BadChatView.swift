//
//  ContentView.swift
//  Chat
//
//  Created by Vincent on 20/05/2024.
//

import SwiftUI

struct BadChatView: View {
    
    @State var data = (0...20).map { $0 }
    
    var body: some View {
        ScrollViewReader { scrollView in
            List(data.reversed(), id: \.self) { int in
                ChatMessage(text: "\(int)")
                    .listRowSeparator(.hidden)
                    .id(int)
                    .onAppear {
                        if int == data.last {
                            loadMoreData()
                        }
                    }
            }
            .listStyle(.plain)
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

#Preview {
    BadChatView()
}
