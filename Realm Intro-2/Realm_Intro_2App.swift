//
//  Realm_Intro_2App.swift
//  Realm Intro-2
//
//  Created by Stewart Lynch on 2022-03-07.
//

/**
 --------------------------
 NOTES:
 
 --------------------------
 UPDATES & QUESTIONS:
 initial commit
 
 don't fully understand what '$' does. reviewing property wrappers
 
 still reviewing property wrappers - denser than I thought
 */

import SwiftUI

@main
struct Realm_Intro_2App: App {
    var body: some Scene {
        WindowGroup {
            CountriesListView()
                .onAppear {
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                    
                }
        }
    }
}
