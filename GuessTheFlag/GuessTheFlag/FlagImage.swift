//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by João Vitor Gonçalves Oliveira on 17/05/23.
//

import SwiftUI

struct FlagImage: View {
    var src: String
    
    var body: some View {
        Image(src)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}
