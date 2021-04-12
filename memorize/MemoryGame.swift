//
//  MemoryGame.swift
//  memorize
//
//  Created by choijisoo on 2021/04/10.
//

import Foundation
struct MemoryGame<CardContent> where CardContent:Equatable {
    
    var cards: Array<Card>
    
    var indexOfTheOneAndOnlyFaceUpCard:Int?{
        get{
            cards.indices.filter {cards[$0].isFaceUp}.only
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp=index == newValue
            }
        }
    }
    mutating func choose(card:Card) {
        print("card chosen: \(card)")
        let chosenIndex = cards.firstIndex(of: card)!
        if !cards[chosenIndex].isFaceUp,!cards[chosenIndex].isMatched{
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
            }else{
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
        }
    }
    
    
    
    
    init(numberOfPairs:Int,factory:(Int)->CardContent) {
        cards = Array<Card>()
        for index in 0..<numberOfPairs{
            let content = factory(index)
            cards.append(Card(isFaceUp: true, isMatched: false, content: content,id:index*2))
            cards.append(Card(isFaceUp: true, isMatched: false, content: content,id:index*2+1))
  
        }
        cards.shuffle()
    }
    
    
    struct Card:Identifiable {
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content: CardContent
        var id: Int
    }
}
