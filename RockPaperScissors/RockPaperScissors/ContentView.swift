//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by João Vitor Gonçalves Oliveira on 17/05/23.
//

import SwiftUI

struct ContentView: View {
    let moves = ["🪨", "📃", "✂️"]
    let winningMoves = ["📃", "✂️", "🪨"]
    @State private var showingFinalScore = false
    @State private var currentQuestion = 0
    @State private var score = 0
    @State private var shouldWin = Bool.random()
    @State private var currentAppMove = Int.random(in: 0...2)
 
    var body: some View {
        VStack(spacing: 10) {
            VStack(spacing: 30) {
                Text("Score: \(score)")
                    .font(.largeTitle)
                VStack {
                    Text("Current app move")
                    Text("\(moves[currentAppMove])")
                        .font(.system(size: 50))
                }
                VStack {
                    Text("Choose the move which")
                    Text(shouldWin ? "WINS" : "LOSES")
                        .font(.largeTitle)
                }
            }
            ForEach(moves, id: \.self) { move in
                Button {
                    playerChoseMove(move)
                } label: {
                    Text(move)
                }
            }
                .font(.system(size: 100))
        }
            .alert("Congratulations!", isPresented: $showingFinalScore) {
                Button("Play again", action: playAgain)
            } message: {
                Text("Your final score is: \(score)")
            }
    }
    
    func playerChoseMove(_ move: String) {
        if move == winningMoves[currentAppMove]
        {
            if shouldWin {
                score += 1
            } else if score > 0 {
                score -= 1
            }
        } else {
            if !shouldWin {
                score += 1
            } else if score > 0 {
                score -= 1
            }
        }
        currentQuestion += 1
        if currentQuestion == 10 {
            showingFinalScore = true
        }
        shouldWin.toggle()
        currentAppMove = Int.random(in: 0...2)
    }
    
    func playAgain() {
        currentQuestion = 0
        score = 0
        shouldWin.toggle()
        currentAppMove = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
