//
//  SlideNumberPuzzleModel.swift
//  SlideNumberPuzzle
//
//  Created by Thammasat Thonggamgaew on 15/2/2567 BE.
//

import Foundation

struct SlideNumberPuzzleModel<CardContentType> {
    private(set) var cards: Array<Card> // private(set) => read only
    var moveCount: Int
    var win: Bool
    
    init(numberOfCards: Int, cardContentFactory: (Int) -> String) {
        cards = []
        for pairIndex in 0..<numberOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
        }
        moveCount = 0
        win = false
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
        let posibleIndex = [chosenIndex-4, chosenIndex-1, chosenIndex+1, chosenIndex+4]
        var swapIndex = -1
        
        for i in posibleIndex {
            if (i > 0 && i < cards.count){
                // find index to swap
                if cards[i].content == "" {
                    swapIndex = i
                    break
                }
            }
        }
        
        if swapIndex != -1 {
            cards.swapAt(chosenIndex, swapIndex)
            moveCount += 1
        }
    }
    

    
    func moveUp(_ chosenIndex: Int) {
//        model.cards
    }
    
    
    
    mutating func restart() {
        moveCount = 0
        win = false
        shuffle()
    }
    
    struct Card: Identifiable {
        init(content: String) {
            self.content = content
        }
        
        let id = UUID()
        let content: String
        
    }
}


