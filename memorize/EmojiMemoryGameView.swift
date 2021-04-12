//
//  EmojiMemoryGameView.swift
//  memorize
//
//  Created by choijisoo on 2021/04/10.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var emojiGame :EmojiMemoryGame
    
    var body: some View {
        Grid(emojiGame.cards){card in
            CardView(card: card).onTapGesture {
                emojiGame.choose(card: card)
            }.padding()
        }
                .padding()
                .foregroundColor(.orange)
                
        
        
    }
}


struct CardView:View {
    var card: MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader{geometry in
            ZStack{
                if card.isFaceUp{
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLinewWidth)
                    Text(card.content)
                }
                else{
                    if !card.isMatched{
                        RoundedRectangle(cornerRadius: cornerRadius).fill()
                    }
                }
            }
            .font(Font.system(size:fontsize(for: geometry.size) ))
        }
    }
    
    
    
    //MARK - Drawing constatns
    
    let cornerRadius:CGFloat = 10.0
    let edgeLinewWidth:CGFloat = 3.0
    let fontScaleFactor:CGFloat = 0.75
    func fontsize(for size:CGSize) -> CGFloat{
        min(size.width,size.height)*fontScaleFactor
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(emojiGame:EmojiMemoryGame())
    }
}
