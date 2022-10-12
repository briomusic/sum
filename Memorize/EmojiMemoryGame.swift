//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Brio Taliaferro on 10.10.22.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    static let symbols = ["✈️","🚋","🛵","🛳","🚗","🚕","🚌","🚎","🚔","🚍","🚘","🚖"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 5) { index in
            symbols[index]
        }
    }

    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
