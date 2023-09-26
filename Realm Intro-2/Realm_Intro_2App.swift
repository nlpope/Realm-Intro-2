//
//  Realm_Intro_2App.swift
//  Realm Intro-2
//
//  Created by Stewart Lynch on 2022-03-07.
//

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
 edit this boilerplate using: cmd + shift + L
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
 
 9.19
 incomplete, bc now Im having an issue where the wrong row is getting removed
 ... for the original order clashing with the .sorted(byKeyPath:) method
 
 List {
     ForEach(countries.sorted(byKeyPath: "name")) { country in
         //below deletion method doesn't work w above .sorted method
         NavigationLink {
             CitiesListView(country: country)
             //nav destination
         } label: {
             CountryRowView(country: country, isFocused: _isFocused)
         }
     }
     .onDelete(perform: $countries.remove)
     .listRowSeparator(.hidden)
     
     
 }
 
 9.20
 white boarding before coding delete func
 
 9.22
 studying diff btwn func calls deleteCountry(indexSet: ) & deleteCountry - sans parenthesis
 
 9.24
 studying pointers & reference types in C to better understand "pass by reference" being usd in .onDelete(perform: ) method
 
 9.25
 done reviewing pointers
 
 9.26
 whiteboarding each file's declaration to better understand how REALM is workin behind the scenes
 --------------------------
 */


