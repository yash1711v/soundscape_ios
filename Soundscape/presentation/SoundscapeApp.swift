//
//  SoundscapeApp.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI
import Firebase
import FirebaseAnalytics
import FirebaseAnalyticsSwift
import FirebaseCore

@main
struct SoundscapeApp: App {
    @StateObject var appViewModel = AppViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView().environmentObject(appViewModel)
                .onAppear() {
                    Analytics.logEvent(AnalyticsEventScreenView,
                                       parameters: [AnalyticsParameterScreenName: "\(SoundscapeApp.self)",
                                                   AnalyticsParameterScreenClass: "\(SoundscapeApp.self)"])
                }
        }
    }
}
