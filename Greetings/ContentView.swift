//
//  ContentView.swift
//  Greetings
//
//  Created by Kartik Madane on 1/23/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var quoteService = QuoteService()
    
    // Get time-based greeting
    private var timeBasedGreeting: (text: String, emoji: String) {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 5..<12:
            return ("Good Morning", "🌅")
        case 12..<17:
            return ("Good Afternoon", "☀️")
        case 17..<21:
            return ("Good Evening", "🌆")
        default:
            return ("Good Night", "🌙")
        }
    }
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                
                // Greeting
                VStack(spacing: 10) {
                    Text("\(timeBasedGreeting.emoji) \(timeBasedGreeting.text)!")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.primary)
                }
                
                // Quote of the Day
                VStack(spacing: 20) {
                    if quoteService.isLoading {
                        ProgressView()
                            .scaleEffect(1.5)
                    } else if let quote = quoteService.quote {
                        VStack(spacing: 15) {
                            Text("\"\(quote.text)\"")
                                .font(.title3)
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 30)
                                .foregroundColor(.primary)
                            
                            Text("— \(quote.author)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .italic()
                        }
                        .padding(25)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.regularMaterial)
                                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                        )
                        .padding(.horizontal, 20)
                    } else if let error = quoteService.errorMessage {
                        VStack(spacing: 10) {
                            Image(systemName: "exclamationmark.triangle")
                                .font(.largeTitle)
                                .foregroundColor(.orange)
                            Text(error)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                            Button("Retry") {
                                quoteService.fetchQuoteOfTheDay()
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        .padding(20)
                    }
                }
                
                Spacer()
                
                // Inspire button
                Button(action: {
                    quoteService.fetchQuoteOfTheDay()
                }) {
                    HStack {
                        Image(systemName: "sparkles")
                        Text("Inspire me")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.blue)
                    )
                }
                .padding(.bottom, 40)
            }
        }
        .onAppear {
            quoteService.fetchQuoteOfTheDay()
        }
    }
}

#Preview {
    ContentView()
}
