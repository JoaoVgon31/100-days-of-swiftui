//
//  ProeminentTitle.swift
//  GuessTheFlag
//
//  Created by João Vitor Gonçalves Oliveira on 17/05/23.
//

import SwiftUI

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .fontWeight(.semibold)
    }
}

extension View {
    func prominentTitle() -> some View {
        modifier(ProminentTitle())
    }
}
