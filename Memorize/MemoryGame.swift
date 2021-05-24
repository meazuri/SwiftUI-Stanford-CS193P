//
//  MemoryGame.swift
//  Memorize
//
//  Created by seintsan on 10/5/21.
//  Copyright © 2021 seintsan. All rights reserved.
//

import Foundation



struct MemoryGame<CardContent>{
    var cards : Array<Card>
    
    mutating func choose(card: Card)  {
        print("card choosen: \(card) ")

        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    func index(of card: Card) -> Int {
        for index  in 0..<self.cards.count{
            if(self.cards[index].id == card.id ){
                return index
            }
        }
        return 0
    }
    init(numberOfPairsOfCards : Int, cardContentFactory:(Int) -> CardContent) {
        cards = Array<Card>()
        
        for pariIndex in 0..<numberOfPairsOfCards {
            
            let content = cardContentFactory(pariIndex)
            
            cards.append(Card(isFaceUp: true, isMatchedCard: false, content: content,id: pariIndex * 2))
            cards.append(Card(isFaceUp: false, isMatchedCard: false, content: content, id: pariIndex * 2+1 ))

        }
    }
    struct Card :Identifiable{
        var isFaceUp : Bool
        var isMatchedCard : Bool
        var content : CardContent
        var id: Int
    }
}
