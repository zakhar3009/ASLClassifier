//
//  ASLApp.swift
//  ASL
//
//  Created by Zakhar Litvinchuk on 15.06.2024.
//

import SwiftUI

@main
struct ASLApp: App {
    @Environment(\.scenePhase) var scenePhase

    init() {
        guard let data = UserDefaults.standard.data(forKey: "UserData") else {
            return
        }
        do {
            let userData = try JSONDecoder().decode(UserData.self, from: data)
            print(userData.solvedLetters)
            DataService.shared.solvedLetters = userData.solvedLetters
        } catch {
            print("Decoding error")
        }
    }

    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .onChange(of: scenePhase) { _, newPhase in
                    if newPhase == .background {
                        saveData()
                    }
                }
        }
    }

    private func saveData() {
        do {
            print("saving data")
            print(DataService.shared.solvedLetters)
            let userData = UserData(solvedLetters: DataService.shared.solvedLetters)
            let data = try JSONEncoder().encode(userData)
            UserDefaults.standard.setValue(data, forKey: "UserData")
        } catch {
            print("Encoding error")
        }
    }
}
