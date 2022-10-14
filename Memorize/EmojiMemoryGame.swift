//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Brio Taliaferro on 10.10.22.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
	
	static func createMemoryGame(theme: Theme<String>) -> MemoryGame<String> {
		MemoryGame<String>(numberOfPairsOfCards: theme.availablePairs) { index in
			theme.emojis[index]
		}
	}
	
	static func createTheme() -> Theme<String> {
		let index = Int.random(in: 0..<Theme<String>.emojiThemes.count)
		return Theme<String>.emojiThemes[index]
	}

	
	private var theme: Theme<String> = EmojiMemoryGame.createTheme()
	@Published private var model: MemoryGame<String>
	
	var cards: Array<MemoryGame<String>.Card> {
		return model.cards
	}

	init() {
		self.model = EmojiMemoryGame.createMemoryGame(theme: theme)
	}
		
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
	
	func newGame() {
		theme = EmojiMemoryGame.createTheme()
		model = EmojiMemoryGame.createMemoryGame(theme: theme)
	}
}
