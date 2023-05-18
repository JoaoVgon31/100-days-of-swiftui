//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by João Vitor Gonçalves Oliveira on 15/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingFinalScore = false
    @State private var guessedFlags = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var score = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .prominentTitle()
                    }
                    ForEach(0..<3) { number in
                        Button {
                           flagTapped(number)
                        } label: {
                            FlagImage(src: countries[number])
                        }
                    }
                }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
                .padding()
        }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text(scoreMessage)
            }
            .alert("Congratulations!", isPresented: $showingFinalScore) {
                Button("Play again", action: playAgain)
            } message: {
                Text("Your final score is \(score)")
            }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct"
            scoreMessage = "Your score is \(score)"
        } else {
            if score > 0 {
                score -= 1
            }
            scoreTitle = "Wrong"
            scoreMessage = "That’s the flag of \(countries[number])!"
        }
        
        guessedFlags += 1
        if guessedFlags == 8 {
            showingFinalScore = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func playAgain() {
        guessedFlags = 0
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
