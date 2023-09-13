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
 
 ' ' ' '
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


/**
 --------------------------
 NOTES:
 9.1 - 9.5 still reviewing focus state binding
 9.6 done reviewing focus state binding - but focus isn't working in the swiftuI preview for some reason, could be a bug. More important stuff to do so moving on
 9.6 jk it works as expected when i run it but not on the preview
 9.7 rebuilding login form on my own to practice focus state
 
 9.12
 CountryRowView(country: country, isFocused: _isFocused) - i don't get why binding is passed like _ instead of $
 
 9.13
 CountriesListView.swift
 CountryRowView(country: country, isFocused: _isFocused)
 //above confuses me; so if @FocusState takes the place of @Binding on the other end ...
 //we're to pass the binding on down by using _ instead of $?
 --------------------------
 UPDATES & QUESTIONS:
 */
