//
//  ContentView.swift
//  Memorize
//
//  Created by Zach on 22/10/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🌻", "🌹", "🧽", "🐌", "🌻", "🌹", "🧽", "🐌"]
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(withEmoji: emojis[index])
                }
            }
            .foregroundColor(.orange)
            
            HStack {
                Button {
                    cardCount -= 1
                } label: {
                    Label("Remove Card", systemImage: "globe")
                }
                Spacer()
                Button("Add Card") {
                    cardCount += 1
                }
            }
        }.padding()
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
