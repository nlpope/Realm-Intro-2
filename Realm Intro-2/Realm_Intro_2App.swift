//
//  Realm_Intro_2App.swift
//  Realm Intro-2
//
//  Created by Stewart Lynch on 2022-03-07.
//

import SwiftUI

@main
struct Realm_Intro_2App: App {
    var migrator = Migrator()
    var body: some Scene {
        WindowGroup {
            TabView {
                CountriesListView()
                    .tabItem {
                        Label("Countries", systemImage: "list.dash")
                    }
                AllCitiesListView()
                    .tabItem {
                        Label("Cities", systemImage: "list.dash")
                    }
            }
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
 
 9.27
 whiteboarding steps for AllCitiesListView before coding
 ---------------------
 MAPPING OUT HOW REALM INTERACTS W SWIFT
 ======
 referenced code @:  Country.swift
 
 class Country: Object, ObjectKeyIdentifiable {
 @Persisted(primaryKey: true) var id: ObjectId
 @Persisted var name: String
 @Persisted var cities: List<City>
 
 }
 
 class Country: Object, ObjectKeyIdentifiable {
 //above protocol (ObjectKeyIdentifiable) ensures your model will work with / be identifiable by REALM
 //note, this file is the "result" that's being "observed" in CountriesListView. Same goes for AllCitiesListView
 //... they're observing changes (results) within the Country/City type's model
 
 @Persisted(primaryKey: true) var id: ObjectId
 //@Persisted = property wrapper making the variable persistable in REALM
 or more spec. used to declare props on Object subclasses to be managed by REALM
 
 @Persisted(primaryKey: true) var id: ObjectId
 //primaryKey = Unique Tracker for when a whole list is populated w this type
 it's used to uniquely identify specific objects in a REALM database (not required, but powerful)
 //added to model classes
 //ALL primary keys must be named "id" when working w REALM
 and only Int, String, UUID, & ObjectID can be made the primary key / tracker
 ======
 referenced code:  City.swift
 
 class City: Object, ObjectKeyIdentifiable {
 @Persisted(primaryKey: true) var id: ObjectId
 @Persisted var name: String
 @Persisted(originProperty: "cities") var country: LinkingObjects<Country>
 
 }
 
 @Persisted(originProperty: "cities") var country: LinkingObjects<Country>
 //basically saying, "Hey, I create a reverse relationship (link) btwn class City & class Country via class Country's "cities" property
 
 --------------------------
 9.29
 referenced code @:  CountriesListView & AllCitiesListView
 
 @ObservedResults(Country.self) var countries
 //basically saying: "Hey, I'm gonna open a new tab in the Realm GUI for you and track type Country & all its properties"
 
 @ObservedResults(City.self, sortDescriptor: SortDescriptor(keyPath: "name")) var cities
 //basically saying, "Hey, I'm gonna open a new tab in the Realm GUI for you and track type City."
 "I'm also gonna sort them by the 'name' prop outside the body since  user can't edit / move data in this view"
 
 //In essence - ObservedResults property wrapper creates a new tab in REALM for the specified type
 //So, add this wrapper to views capable of adding/removing objjects to a list
 Which makes sense, since what's being edited in real time on the main list views is what needs to be OBSERVED
 
 --------------------------
10.5
 
 adding FlagPicker file to pull from CountryInfo & to be used in CountryRowView
 
 white-boarding for Comix Organizer App
 
 --------------------------
 10. 6
 convenience init example in Country.swift

 setting up FlagPicker
 
 10.8
 added a button to display the flag picker and made the button img (label) a flag
 --------------------------
 */


