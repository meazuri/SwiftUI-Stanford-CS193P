//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by seintsan on 10/5/21.
//  Copyright © 2021 seintsan. All rights reserved.
//

import SwiftUI

func createCardContent(pariIndex: Int) -> String {
    return "😆"
}

class EmojiMemoryGame : ObservableObject{
    @Published private var model : MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻","🎃","🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) {
            parinIndex in
            return emojis[parinIndex]
        }
    }
    
    
    //MARK: - to access to model
    var cards : Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card)  {
        model.choose(card: card)
    }
}
