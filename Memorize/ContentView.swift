//
//  ContentView.swift
//  Memorize
//
//  Created by Zach on 22/10/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🌻", "🐛", "🧽", "🐌", "👽"]
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
            ForEach(emojis, id: \.self) { emoji in
                CardView(withEmoji: emoji)
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    @State var isFaceUp = true
    let withEmoji: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 4)
                Text(withEmoji)
                    .font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
