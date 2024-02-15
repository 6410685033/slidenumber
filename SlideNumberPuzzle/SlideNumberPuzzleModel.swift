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
    var win: Bool = false
    
    init(numberOfCards: Int, cardContentFactory: (Int) -> String) {
        cards = []
        for pairIndex in 0..<numberOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
        }
        moveCount = 0
        // shuffle() // shuffle not called here
    }

    mutating func shuffle() {
        cards.shuffle()
    }
    
    private func index(of card: Card) -> Int {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    
    
    mutating func move(_ card: Card) {
        // down +4, up -4, right +1, left -1
        let chosenIndex = index(of: card)
        let posibleIndex = [chosenIndex-4, chosenIndex-1, chosenIndex+1, chosenIndex+4]
        var swapIndex = -1
        
        for i in posibleIndex {
            if (i >= 0 && i < cards.count){
                // find index to swap
                if cards[i].content == "" {
                    swapIndex = i
                    break
                }
            }
        }
        
        // chosen card can swap
        if swapIndex != -1 {
            cards.swapAt(chosenIndex, swapIndex)
            moveCount += 1
            checkWin()
        }
    }
    
    mutating func checkWin() {
        for i in 0..<15 {
            let index = String(i+1)
            let current = cards[i].content
            
            if index != current {
                return
            }
            print(win)
        }
        win = true
    }

    mutating func restart() {
        moveCount = 0
        shuffle()
        win = false
    }
    
    struct Card: Identifiable {
        init(content: String) {
            self.content = content
        }
        
        let id = UUID()
        let content: String
    
    }
}


