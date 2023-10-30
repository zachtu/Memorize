//
//  ContentView.swift
//  Memorize
//
//  Created by Zach on 22/10/2023.
//

import SwiftUI

enum Theme {
    case flowers, faces, animals
}

struct ThemeOption: Identifiable {
    var id: Int
    var name: String
    var color: Color
    var emojis: [String]
    var icon: String
}

struct ContentView: View {
    @State private var theme: Theme = .animals
    
    let themes: [Theme: ThemeOption] = [
        .flowers: ThemeOption(id: 1, name: "Flowers", color: .orange, emojis: ["🌻", "🌸", "🌹", "🌼", "🪵", "🥀", "🍄", "🌾", "💐", "🪴", "🌻", "🌸", "🌹", "🌼", "🪵", "🥀", "🍄", "🌾", "💐", "🪴"].shuffled(), icon: "camera.macro"),
        .animals: ThemeOption(id: 2, name: "Animals", color: .red, emojis: ["🐙", "🐌", "🐳", "🦭", "🐛", "🐝", "🐷", "🪿", "🐘", "🦒", "🐙", "🐌", "🐳", "🦭", "🐛", "🐝", "🐷", "🪿", "🐘", "🦒"].shuffled(), icon: "dog.fill"),
        .faces: ThemeOption(id: 3, name: "Faces", color: .blue, emojis: ["😂", "😛", "😄", "🧐", "😎", "😅", "🤩", "🥸", "😂", "😛", "😄", "🧐", "😎", "😅", "🤩", "🥸"].shuffled(), icon: "face.smiling.inverse")
    ]
    
    var themeOptions: ThemeOption {
        themes[theme]!
    }
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            HStack {
                ForEach(Array(themes.keys), id: \.self) { themeKey in
                    let themeOption = themes[themeKey]!
                    Button {
                        theme = themeKey
                    } label: {
                        VStack {
                            Image(systemName: themeOption.icon)
                                .font(.title)
                            Text(themeOption.name)
                        }
                    }.padding()
                }
            }
        }
        .padding()
    }
    
    var cards: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(themeOptions.emojis.indices, id: \.self) { index in
                    CardView(withEmoji: themeOptions.emojis[index]).aspectRatio(2/3, contentMode: .fit)
                }
            }
            .foregroundColor(themeOptions.color)
        }
    }
}

struct CardView: View {
    @State var isFaceUp = false
    let withEmoji: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 3)
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
