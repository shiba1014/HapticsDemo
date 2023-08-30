//
//  ContentView.swift
//  HapticsDemo
//

import SwiftUI

struct ContentView: View {
    private let hapticClient: HapticClient

    init() {
        do {
            hapticClient = try HapticClient()
        }
        catch {
            fatalError("\(error.localizedDescription)")
        }
    }

    var body: some View {
        NavigationStack {
            List {
                NavigationLink("EventType") {
                    EventTypeView(hapticClient: hapticClient)
                }
                NavigationLink("intensity") {
                    IntensityView(hapticClient: hapticClient)
                }
                NavigationLink("sharpness") {
                    SharpnessView(hapticClient: hapticClient)
                }
                NavigationLink("relativeTime") {
                    RelativeTimeView(hapticClient: hapticClient)
                }
                NavigationLink("duration") {
                    DurationView(hapticClient: hapticClient)
                }
                NavigationLink("sustained") {
                    SustainedView(hapticClient: hapticClient)
                }
                NavigationLink("attack") {
                    AttackView(hapticClient: hapticClient)
                }
                NavigationLink("release/decay") {
                    ReleaseDecayView(hapticClient: hapticClient)
                }
            }
        }
    }
}
