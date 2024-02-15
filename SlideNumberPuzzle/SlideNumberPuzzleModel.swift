//
//  SlideNumberPuzzleModel.swift
//  SlideNumberPuzzle
//
//  Created by Thammasat Thonggamgaew on 15/2/2567 BE.
//

import Foundation

struct SlideNumberPuzzleModel<CardContentType> {
    private(set) var cards: Array<Card> // private(set) => read only
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> String) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
        }
        shuffle()
    }
    
//    mutating func choose(_ card: Card) { // .choose(card) no need to .choose(card: card)
//        let chosenIndex = index(of: card)
//        cards[chosenIndex].isFaceUp.toggle()
//    }
    
    private func index(of card: Card) -> Int {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        init(content: String) {
            self.content = content
        }
        
        let id = UUID()
        let content: String
    }
}


