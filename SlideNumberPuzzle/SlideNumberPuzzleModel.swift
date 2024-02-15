//
//  SlideNumberPuzzleModel.swift
//  SlideNumberPuzzle
//
//  Created by Thammasat Thonggamgaew on 15/2/2567 BE.
//

import Foundation

struct SlideNumberPuzzleModel<CardContentType> {
    private(set) var cards: Array<Card> // private(set) => read only
    
    init(numberOfCards: Int, cardContentFactory: (Int) -> String) {
        cards = []
        for pairIndex in 0..<numberOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
        }
//        shuffle()
    }
    
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
    
    
    mutating func move(_ card: Card) {
        // down +4, up -4, right +1, left -1
        let chosenIndex = index(of: card)
        var swapIndex = -1
        
        for i in 0...15 {
            if cards[i].content == "" {
                swapIndex = i
                break
            }
        }
        
        swapIndex == -1 ? nil:cards.swapAt(chosenIndex, swapIndex)
    }
    
    func moveUp(_ chosenIndex: Int) {
//        model.cards
    }
    
    struct Card: Identifiable {
        init(content: String) {
            self.content = content
        }
        
        let id = UUID()
        let content: String
        
    }
}


