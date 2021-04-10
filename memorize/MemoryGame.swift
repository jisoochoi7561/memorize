//
//  MemoryGame.swift
//  memorize
//
//  Created by choijisoo on 2021/04/10.
//

import Foundation
struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    func choose(card:Card) {
        print("card chosen: \(card)")
    }
    
    struct Card {
        var isFaceUp:Bool
        var isMatched:Bool
        var content: CardContent
    }
}
