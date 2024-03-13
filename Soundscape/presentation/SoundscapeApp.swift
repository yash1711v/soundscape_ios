//
//  SoundscapeApp.swift
//  Soundscape
//
//  Created by admin on 28/02/24.
//

import SwiftUI

@main
struct SoundscapeApp: App {
    var appViewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            SplashView().environmentObject(appViewModel)
        }
    }
}
