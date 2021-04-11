//
//  ContentView.swift
//  memorize
//
//  Created by choijisoo on 2021/04/10.
//

import SwiftUI

struct ContentView: View {
    var emojiGame :EmojiMemoryGame
    
    var body: some View {
        HStack{
            ForEach(emojiGame.cards){card in 
                CardView(card: card).onTapGesture {
                    emojiGame.choose(card: card)
                }
            }
        }
                .padding()
                .foregroundColor(.orange)
                .font(.largeTitle)
        
        
    }
}


struct CardView:View {
    var card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            }
            else{
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
        
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojiGame:EmojiMemoryGame())
    }
}
