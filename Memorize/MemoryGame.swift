//
//  MemoryGame.swift
//  Memorize
//
//  Created by Brio Taliaferro on 10.10.22.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: Array<Card>
    
    private var indexOfFaceUpCard: Int?
    private(set) var score: Int = 0
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            
            if let potentialIndex = indexOfFaceUpCard {
                
                // turning second card
                
                if cards[chosenIndex].content == cards[potentialIndex].content {
                    
                    // match!
                    
                    cards[chosenIndex].isMatched = true
                    cards[potentialIndex].isMatched = true
                    score += 2
                } else {
                    
                    // no match
                    
                    if cards[chosenIndex].hasBeenSeen {
                        score -= 1
                    }
                    if cards[potentialIndex].hasBeenSeen {
                        score -= 1
                    }
                }
                indexOfFaceUpCard = nil
                
            } else {
                
                for index in cards.indices {
                    if cards[index].isFaceUp == true {
                        cards[index].turnOver()
                    }
                }
                indexOfFaceUpCard = chosenIndex
                
            }
            
            cards[chosenIndex].turnOver()
            print("chosen card:\(cards[chosenIndex])")
            print("\(cards)")
        }
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
            
        return nil
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id:pairIndex*2))
            cards.append(Card(content: content, id:pairIndex*2+1))
        }
        
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false {
            didSet {
            }
        }
        var isMatched: Bool = false
        var hasBeenSeen: Bool = false
        var content: CardContent
        var id: Int
        
        mutating func turnOver() {
            if isFaceUp == true,
               isMatched == false {
                hasBeenSeen = true
            }
            self.isFaceUp.toggle()
        }
    }
}
