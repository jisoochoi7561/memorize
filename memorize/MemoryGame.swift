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
    
    
    init(numberOfPairs:Int,factory:(Int)->CardContent) {
        cards = Array<Card>()
        for index in 0..<numberOfPairs{
            let content = factory(index)
            cards.append(Card(isFaceUp: true, isMatched: false, content: content,id:index*2))
            cards.append(Card(isFaceUp: true, isMatched: false, content: content,id:index*2+1))
  
        }
    }
    
    
    struct Card:Identifiable {
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content: CardContent
        var id: Int
    }
}
