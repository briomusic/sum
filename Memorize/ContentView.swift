//
//  ContentView.swift
//  Memorize
//
//  Created by Brio Taliaferro on 06.10.22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
		VStack {
			ScrollView {
				LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
					ForEach(viewModel.cards) { card in
						CardView(card: card, color: viewModel.theme.color)
							.aspectRatio(2/3, contentMode: .fit)
							.onTapGesture {
								viewModel.choose(card)
							}
					}
				}
				.foregroundColor(viewModel.theme.color)
			}
			.padding(.horizontal)
			
			Spacer()
			
			Button {
				viewModel.newGame()
			} label: {
				Text("New Game")
			}
		}
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
	let color: Color
    
    var body: some View {
        
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill(color)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
