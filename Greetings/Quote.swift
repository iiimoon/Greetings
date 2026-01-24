//
//  Quote.swift
//  Greetings
//
//  Created by Kartik Madane on 1/23/26.
//

import Foundation

struct Quote: Identifiable {
    var id: UUID { UUID() }
    let text: String
    let author: String
    
    init(text: String, author: String) {
        self.text = text
        self.author = author
    }
}
