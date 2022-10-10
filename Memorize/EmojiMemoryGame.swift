//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Brio Taliaferro on 10.10.22.
//

import SwiftUI


class EmojiMemoryGame {
    static let symbols = ["✈️","🚋","🛵","🛳","🚗","🚕","🚌","🚎","🚔","🚍","🚘","🚖"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { index in
            symbols[index]
        }
    }

    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
