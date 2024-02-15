//
//  NumberViewModel.swift
//  SlideNumberPuzzle
//
//  Created by Thammasat Thonggamgaew on 15/2/2567 BE.
//

import Foundation

class NumberViewModel: ObservableObject { // ObservableObject make this class update in ContentView
    static let numberList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "15", "11", "13", "14", "12", ""]
    
    @Published private var model = SlideNumberPuzzleModel<String>(numberOfCards: numberList.count) {index in
        numberList[index]
    }
    
    var cards: [SlideNumberPuzzleModel<String>.Card] { // .card
        return model.cards
    }
    
    func shuffle() { // .shuffle()
        model.shuffle()
    }
    
    func move(_ card: SlideNumberPuzzleModel<String>.Card) {
        model.move(card)
    }
    
//    func choose(_ card: SlideNumberPuzzleModel<String>.Card) {
//        model.choose(card)
//    }
}
