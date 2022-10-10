//
//  ContentView.swift
//  Memorize
//
//  Created by Brio Taliaferro on 06.10.22.
//

import SwiftUI

struct ContentView: View {
    var symbols = ["✈️","🚋","🛵","🛳","🚗","🚕","🚌","🚎","🚔","🚍","🚘","🚖"]
    @State var symbolCount = 10

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(symbols[0..<symbolCount], id: \.self) { symbol in
                        CardView(content: symbol)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
    
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
                    .foregroundColor(.orange)
            } else {
                shape.fill(.red)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
