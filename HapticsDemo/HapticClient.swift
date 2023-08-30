//
//  HapticClient.swift
//  HapticsDemo
//

import CoreHaptics

class HapticClient {
    private let engine: CHHapticEngine

    init() throws {
        engine = try CHHapticEngine()
        try engine.start()
    }

    func play(_ event: CHHapticEvent, at time: TimeInterval = 0) throws {
        let pattern = try CHHapticPattern(events: [event], parameters: [])
        let player = try engine.makePlayer(with: pattern)
        try player.start(atTime: time)
    }
}
