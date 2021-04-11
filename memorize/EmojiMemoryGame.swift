//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by choijisoo on 2021/04/10.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject{
    @Published private var game:MemoryGame<String> = createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["1","2","3","4"]
        return MemoryGame<String>(numberOfPairs: emojis.count){index in emojis[index]}
    }
      
    
    
    // MARK : -Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    
    // MARK - Intent
    
    func choose(card:MemoryGame<String>.Card){
        game.choose(card: card)
    }
}
