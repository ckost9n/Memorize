//
//  ContentView.swift
//  Memorize
//
//  Created by Konstantin on 19.09.2022.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚲", "🏎", "🚒", "🚌", "🛻", "🚛",
                  "🛵", "🚜", "🚖", "🚃", "🚘", "🚈",
                  "✈️", "🚀", "🚁", "🛥", "🚔", "🚕",
                  "🚑", "🏍", "🚠", "⛵️", "🛸", "🚢"
    ]
    @State var emojiCount: Int = 24

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in 
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack {
                remove
                Spacer()
                Text("Shuffle")
                    .foregroundColor(.blue)
                Spacer()
                add
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            VStack {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
            }
        }
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            VStack {
                Image(systemName: "minus.circle")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
