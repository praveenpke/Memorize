//
//  ContentView.swift
//  Memorize
//
//  Created by praveen emani on 9/21/23.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🙄", "💀", "🤜", "🤑","👻", "🙄", "💀", "🤜", "🤑","👻", "🙄", "💀", "🤜", "🤑"]
    @State var cardCount: Int = 5

    var body: some View {
        return VStack{
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjustes
        }
        .padding()
    }
    
    
    var cardCountAdjustes: some View{
        return HStack {
            cardAdder
            Spacer()
            cardRemover
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    
    var cards: some View{
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self){
                index in CardView(content: emojis[index] ,isFaceUp: true)
                    .aspectRatio(2/2, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        return Button(action:{
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount+offset < 1 || cardCount+offset > emojis.count)
    }
    
    
    var cardRemover: some View{
        return cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
    
    var cardAdder: some View{
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
}



struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        return ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
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
