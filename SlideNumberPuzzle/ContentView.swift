//
//  ContentView.swift
//  SlideNumberPuzzle
//
//  Created by Thammasat Thonggamgaew on 15/2/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = NumberViewModel()
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()]) {
                ForEach(viewModel.cards) { card in
                    CardView(card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.move(card)
                        }
                }
                }
            .foregroundColor(.blue)
            Spacer()
            }
        .padding()
        }
    }

struct CardView: View {
    var card: SlideNumberPuzzleModel<String>.Card

    init(_ card: SlideNumberPuzzleModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius:12)
            
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
            }.opacity(card.content=="" ? 0 : 1)
        }
    }
}

#Preview {
    ContentView()
}
