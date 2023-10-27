//
//  ContentView.swift
//  Memorize
//
//  Created by Zach on 22/10/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🌻", "🐛", "🧽", "🐌", "🌻", "👽", "🧽", "🐌"]
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjusters
        }
        .padding()
    }
    
    var cardRemover: some View {
        Button {
            if cardCount > 1 {
                cardCount -= 1
            }
            
        } label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
        }
    }
    
    var cardAdder: some View {
        Button {
            if cardCount < emojis.count {
                cardCount += 1
            }
            
        } label: {
            Image(systemName: "rectangle.stack.badge.plus.fill")
        }
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(withEmoji: emojis[index])
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
}

struct CardView: View {
    @State var isFaceUp = false
    let withEmoji: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 4)
                Text(withEmoji)
                    .font(.largeTitle)
            } else {
                base
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
