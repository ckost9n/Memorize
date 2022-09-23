//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Konstantin on 19.09.2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { newValue in
            switch newValue {
                
            case .background:
                print("App is bacground")
            case .inactive:
                print("App is inactive")
            case .active:
                print("App is active")
            @unknown default:
                print("App is error")
            }
        }
    }
    
        
}
