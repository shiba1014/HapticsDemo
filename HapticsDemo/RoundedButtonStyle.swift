//
//  RoundedButtonStyle.swift
//  HapticsDemo
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 15, weight: .bold))
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(5)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
