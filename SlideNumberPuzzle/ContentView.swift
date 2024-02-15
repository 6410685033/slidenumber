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
            // Heading
            let slideText = Text("Slide")
                .bold()
                .font(.system(size: 36))
                .rotationEffect(Angle(degrees: -5)) // Slight tilt

            let numberText = Text("Number")
                .italic()
                .font(.system(size: 32))
                .offset(x: -5) // Slight offset

            let puzzleText = Text("Puzzle")
                .bold()
                .font(.system(size: 30))
                .foregroundColor(.purple)
                .shadow(color: .gray, radius: 2) // Add shadow

            HStack {
                slideText
                numberText
                puzzleText
            }

            // Number Card
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()]) {
                ForEach(viewModel.cards) { card in
                    CardView(card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            withAnimation{
                                viewModel.move(card)
                            }
                        }
                }
            }
            .foregroundColor(.mint)
            Spacer()
            
            // Move Count
            let fontScale = (1 + Double(viewModel.moveCount) / 20) // Adjust multiplier
            let text = Text("Moves: \(viewModel.moveCount)")
                .font(.system(size: fontScale>3 ? 60 : 20 * fontScale))
                .foregroundColor(Color(hue: 0.2 * fontScale, saturation: 1, brightness: 1))
            text

            
            Spacer()
            
            if viewModel.win {
                Text("You won!")
                    .foregroundColor(.green)
                    .font(.title)
            }
            
            Button("Restart") {
                viewModel.restart()
            }
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
