//
//  QuoteService.swift
//  Greetings
//
//  Created by Kartik Madane on 1/23/26.
//

import Foundation
import Combine

class QuoteService: ObservableObject {
    @Published var quote: Quote?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    // Local list of 30 thoughtful quotes
    private let localQuotes: [Quote] = [
        Quote(text: "The only way to do great work is to love what you do.", author: "Steve Jobs"),
        Quote(text: "In the middle of difficulty lies opportunity.", author: "Albert Einstein"),
        Quote(text: "The future belongs to those who believe in the beauty of their dreams.", author: "Eleanor Roosevelt"),
        Quote(text: "It is during our darkest moments that we must focus to see the light.", author: "Aristotle"),
        Quote(text: "The journey of a thousand miles begins with one step.", author: "Lao Tzu"),
        Quote(text: "Success is not final, failure is not fatal: it is the courage to continue that counts.", author: "Winston Churchill"),
        Quote(text: "The only impossible journey is the one you never begin.", author: "Tony Robbins"),
        Quote(text: "What lies behind us and what lies before us are tiny matters compared to what lies within us.", author: "Ralph Waldo Emerson"),
        Quote(text: "Your time is limited, so don't waste it living someone else's life.", author: "Steve Jobs"),
        Quote(text: "Believe you can and you're halfway there.", author: "Theodore Roosevelt"),
        Quote(text: "Everything you've ever wanted is on the other side of fear.", author: "George Addair"),
        Quote(text: "Success is not how high you have climbed, but how you make a positive difference to the world.", author: "Roy T. Bennett"),
        Quote(text: "Happiness is not something ready made. It comes from your own actions.", author: "Dalai Lama"),
        Quote(text: "It does not matter how slowly you go as long as you do not stop.", author: "Confucius"),
        Quote(text: "Life is what happens when you're busy making other plans.", author: "John Lennon"),
        Quote(text: "The purpose of our lives is to be happy.", author: "Dalai Lama"),
        Quote(text: "Get busy living or get busy dying.", author: "Stephen King"),
        Quote(text: "You only live once, but if you do it right, once is enough.", author: "Mae West"),
        Quote(text: "Many of life's failures are people who did not realize how close they were to success when they gave up.", author: "Thomas A. Edison"),
        Quote(text: "If you want to live a happy life, tie it to a goal, not to people or things.", author: "Albert Einstein"),
        Quote(text: "Never let the fear of striking out keep you from playing the game.", author: "Babe Ruth"),
        Quote(text: "Money and success don't change people; they merely amplify what is already there.", author: "Will Smith"),
        Quote(text: "Your time is limited, don't waste it living someone else's life.", author: "Steve Jobs"),
        Quote(text: "Not how long, but how well you have lived is the main thing.", author: "Seneca"),
        Quote(text: "If life were predictable it would cease to be life, and be without flavor.", author: "Eleanor Roosevelt"),
        Quote(text: "The whole secret of a successful life is to find out what is one's destiny to do, and then do it.", author: "Henry Ford"),
        Quote(text: "In order to write about life first you must live it.", author: "Ernest Hemingway"),
        Quote(text: "The big lesson in life, baby, is never be scared of anyone or anything.", author: "Frank Sinatra"),
        Quote(text: "Sing like no one's listening, love like you've never been hurt, dance like nobody's watching, and live like it's heaven on earth.", author: "Mark Twain"),
        Quote(text: "Curiosity about life in all of its aspects, I think, is still the secret of great creative people.", author: "Leo Burnett")
    ]
    
    func fetchQuoteOfTheDay() {
        // No loading state needed for local fetch
        isLoading = false
        errorMessage = nil
        
        // Logic:
        // 1. If we don't have a quote yet (first launch), pick one based on the day of the year.
        //    This gives a consistent "Quote of the Day" experience.
        // 2. If we already have a quote (user tapped "Inspire Me"), pick a random one.
        
        if quote == nil {
            // Pick based on day of year
            let dayOfYear = Calendar.current.ordinality(of: .day, in: .year, for: Date()) ?? 1
            // Use modulo to wrap around if we have fewer quotes than days
            let index = (dayOfYear - 1) % localQuotes.count
            quote = localQuotes[index]
        } else {
            // User wants a new random quote
            var newQuote = localQuotes.randomElement()
            
            // Try to avoid showing the exact same quote twice in a row
            while newQuote?.text == quote?.text && localQuotes.count > 1 {
                newQuote = localQuotes.randomElement()
            }
            
            quote = newQuote
        }
    }
}
