//
//  ContentView.swift
//  Memorize
//
//  Created by Brio Taliaferro on 06.10.22.
//

import SwiftUI

struct Symbols {
	static let traffic = ["✈️","🚋","🛵","🛳","🚗","🚕","🚌","🚎","🚔","🚍","🚘","🚖"]
	static let fruit = ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍍","🥝"]
	static let animals = ["🐶","🐭","🐰","🦊","🐻","🐼","🐷","🐸","🐔","🦉","🦆","🦋"]
}

enum Theme: CaseIterable {
	case traffic
	case fruit
	case animals
	
	var items: Array<String> {
		switch self {
		case .traffic:
			return Symbols.traffic
		case .animals:
			return Symbols.animals
		case .fruit:
			return Symbols.fruit
		}
	}
	
	var symbol: Image {
		switch self {
		case .traffic:
			return Image(systemName: "plus.circle")
		case .animals:
			return Image(systemName: "minus.circle")
		case .fruit:
			return Image(systemName: "minus.circle")
		}
	}
}

struct ContentView: View {
	
	@State var symbols = Symbols.traffic.shuffled()
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
			
			HStack {
				Spacer()
				ForEach(Theme.allCases, id: \.self) { theme in
					ThemeButton(theme: theme) {
						print("switch to \(String(describing: theme))")
						symbols = theme.items
						
					}
					Spacer()
				}
			}
			.font(.largeTitle)
			.padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct ThemeButton: View {
	var theme: Theme
	var callback: () -> Void
	var body: some View {
		Button {
			callback()
		} label: {
			VStack {
				theme.symbol
				Text(String(describing: theme))
			}
		}
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
