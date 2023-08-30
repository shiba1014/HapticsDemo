//
//  ChildViews.swift
//  HapticsDemo
//

import CoreHaptics
import SwiftUI

enum DefaultValue {
    static let intensity: Float = 0.8
    static let sharpness: Float = 0.5
    static let relativeTime: TimeInterval = 0
    static let duration: TimeInterval = 1
    static let attackTime: Float = 0.5
    static let releaseOrDecayTime: Float = 0.5
}

struct EventTypeView: View {
    let hapticClient: HapticClient

    var body: some View {
        HStack {
            Button("Transient") {
                transient()
            }
            .buttonStyle(RoundedButtonStyle())

            Button("Continuous") {
                continuous()
            }
            .buttonStyle(RoundedButtonStyle())
        }
        .padding()
    }

    private func transient() {
        let event = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [
                .init(parameterID: .hapticIntensity, value: DefaultValue.intensity),
                .init(parameterID: .hapticSharpness, value: DefaultValue.sharpness),
            ],
            relativeTime: DefaultValue.relativeTime
        )
        try? hapticClient.play(event)
    }

    private func continuous() {
        let event = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [
                .init(parameterID: .hapticIntensity, value: DefaultValue.intensity),
                .init(parameterID: .hapticSharpness, value: DefaultValue.sharpness),
            ],
            relativeTime: DefaultValue.relativeTime,
            duration: 0.5
        )
        try? hapticClient.play(event)
    }
}

struct IntensityView: View {
    let hapticClient: HapticClient
    @State private var intensity: Float = DefaultValue.intensity

    var body: some View {
        VStack {
            Text("Intensity: \(String(format: "%.2f", intensity))")
            Slider(value: $intensity)

            Button("Play") {
                play()
            }
            .padding(.top)
            .buttonStyle(RoundedButtonStyle())
        }
        .padding()
    }

    private func play() {
        let event = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [
                .init(parameterID: .hapticIntensity, value: intensity),
                .init(parameterID: .hapticSharpness, value: DefaultValue.sharpness),
            ],
            relativeTime: DefaultValue.relativeTime
        )
        try? hapticClient.play(event)
    }
}

struct SharpnessView: View {
    let hapticClient: HapticClient
    @State private var sharpness: Float = DefaultValue.sharpness

    var body: some View {
        VStack {
            Text("Sharpness: \(String(format: "%.2f", sharpness))")
            Slider(value: $sharpness)

            Button("Play") {
                play()
            }
            .padding(.top)
            .buttonStyle(RoundedButtonStyle())
        }
        .padding()
    }

    private func play() {
        let event = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [
                .init(parameterID: .hapticIntensity, value: DefaultValue.intensity),
                .init(parameterID: .hapticSharpness, value: sharpness),
            ],
            relativeTime: DefaultValue.relativeTime
        )
        try? hapticClient.play(event)
    }
}

struct RelativeTimeView: View {
    let hapticClient: HapticClient
    @State private var relativeTime: Float = Float(DefaultValue.relativeTime)

    var body: some View {
        VStack {
            Text("relativeTime: \(String(format: "%.2f", relativeTime)) sec")
            Slider(value: $relativeTime)

            Button("Play") {
                play()
            }
            .padding(.top)
            .buttonStyle(RoundedButtonStyle())
        }
        .padding()
    }

    private func play() {
        let event = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [
                .init(parameterID: .hapticIntensity, value: DefaultValue.intensity),
                .init(parameterID: .hapticSharpness, value: DefaultValue.sharpness),
            ],
            relativeTime: TimeInterval(relativeTime)
        )
        try? hapticClient.play(event)
    }
}

struct DurationView: View {
    let hapticClient: HapticClient
    @State private var duration: Float = Float(DefaultValue.duration)

    var body: some View {
        VStack {
            Text("Duration: \(String(format: "%.2f", duration)) sec")
            Slider(value: $duration, in: 0...30)

            Button("Play") {
                play()
            }
            .padding(.top)
            .buttonStyle(RoundedButtonStyle())
        }
        .padding()
    }

    private func play() {
        let event = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [
                .init(parameterID: .hapticIntensity, value: DefaultValue.intensity),
                .init(parameterID: .hapticSharpness, value: DefaultValue.sharpness),
            ],
            relativeTime: DefaultValue.relativeTime,
            duration: TimeInterval(duration)
        )
        try? hapticClient.play(event)
    }
}

struct SustainedView: View {
    let hapticClient: HapticClient
    @State private var sustained: Bool = true

    var body: some View {
        VStack {
            Text("sustained: \(sustained.description)")
            Toggle("Sustained", isOn: $sustained)

            Button("Play") {
                play()
            }
            .padding(.top)
            .buttonStyle(RoundedButtonStyle())
        }
        .padding()
    }

    private func play() {
        let event = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [
                .init(parameterID: .hapticIntensity, value: DefaultValue.intensity),
                .init(parameterID: .hapticSharpness, value: DefaultValue.sharpness),
                .init(parameterID: .sustained, value: sustained ? 1.0 : 0.0),
                .init(parameterID: .attackTime, value: DefaultValue.attackTime),
                .init(parameterID: sustained ? .releaseTime : .decayTime, value: DefaultValue.releaseOrDecayTime),
            ],
            relativeTime: DefaultValue.relativeTime,
            duration: DefaultValue.duration
        )
        try? hapticClient.play(event)
    }
}

struct AttackView: View {
    let hapticClient: HapticClient
    @State private var attackTime: Float = DefaultValue.attackTime

    var body: some View {
        VStack {
            Text("Attack: \(String(format: "%.2f", attackTime))")
            Slider(value: $attackTime)

            Button("Play") {
                play()
            }
            .padding(.top)
            .buttonStyle(RoundedButtonStyle())
        }
        .padding()
    }

    private func play() {
        let event = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [
                .init(parameterID: .hapticIntensity, value: DefaultValue.intensity),
                .init(parameterID: .hapticSharpness, value: DefaultValue.sharpness),
                .init(parameterID: .sustained, value: 0.0),
                .init(parameterID: .attackTime, value: attackTime),
            ],
            relativeTime: DefaultValue.relativeTime,
            duration: 10
        )
        try? hapticClient.play(event)
    }
}

struct ReleaseDecayView: View {
    let hapticClient: HapticClient
    @State private var sustained: Bool = true
    @State private var releaseOrDecayTime: Float = DefaultValue.releaseOrDecayTime

    var body: some View {
        VStack {
            Text("sustained: \(sustained.description)")
            Toggle("Sustained", isOn: $sustained)

            if sustained {
                Text("Release: \(String(format: "%.2f", releaseOrDecayTime))")
            }
            else {
                Text("Decay: \(String(format: "%.2f", releaseOrDecayTime))")
            }
            Slider(value: $releaseOrDecayTime)

            Button("Play") {
                play()
            }
            .padding(.top)
            .buttonStyle(RoundedButtonStyle())
        }
        .padding()
    }

    private func play() {
        let event = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [
                .init(parameterID: .hapticIntensity, value: DefaultValue.intensity),
                .init(parameterID: .hapticSharpness, value: DefaultValue.sharpness),
                .init(parameterID: .sustained, value: sustained ? 1.0 : 0.0),
                .init(parameterID: .attackTime, value: DefaultValue.attackTime),
                sustained
                    ? .init(parameterID: .releaseTime, value: releaseOrDecayTime)
                    : .init(parameterID: .decayTime, value: releaseOrDecayTime),
            ],
            relativeTime: DefaultValue.relativeTime,
            duration: DefaultValue.duration
        )
        try? hapticClient.play(event)
    }
}
