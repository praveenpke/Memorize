//
//  ContentView.swift
//  Memorize
//
//  Created by praveen emani on 9/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}



struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base
                    .foregroundColor(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text("👻")
                    .font(.largeTitle)
            }else{
                base
                    .foregroundColor(.orange)
            }
        }
    }
}




#Preview {
    ContentView()
}
