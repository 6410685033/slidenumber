//
//  NumberViewModel.swift
//  SlideNumberPuzzle
//
//  Created by Thammasat Thonggamgaew on 15/2/2567 BE.
//

import Foundation

class NumberViewModel: ObservableObject { // ObservableObject make this class update in ContentView
    static let numberList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    
    @Published private var model = SlideNumberPuzzleModel<String>(numberOfPairsOfCards: numberList.count) {index in
        numberList[index]
    }
    
    var cards: [SlideNumberPuzzleModel<String>.Card] { // .card
        return model.cards
    }
    
    func shuffle() { // .shuffle()
        model.shuffle()
    }
    
//    func choose(_ card: SlideNumberPuzzleModel<String>.Card) {
//        model.choose(card)
//    }
}
