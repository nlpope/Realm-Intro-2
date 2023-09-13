//
//  ContentView.swift
//  Realm Intro-2
//
//  Created by Stewart Lynch on 2022-03-07.
//

import SwiftUI
import RealmSwift

struct CountriesListView: View {
    //ObservedResults observing type Country = from RealmSwift import
    @ObservedResults(Country.self) var countries
    @FocusState private var isFocused: Bool?
    
    var body: some View {
        NavigationView {
            VStack {
                if countries.isEmpty {
                    Text("Tap on the \(Image(systemName: "plus.circle.fill")) button above to create a new Country.")
                } else {
                    List {
                        ForEach(countries) { country in
                            CountryRowView(country: country, isFocused: _isFocused)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
                Spacer()
            }
            .navigationTitle("Countries")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //that triggers this action
                        $countries.append(Country())
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
                //new focus state stuff
                ToolbarItemGroup(placement: .keyboard) {
                    HStack {
//                        Spacer()
                        Button {
                            isFocused = nil
                        } label: {
                            Image(systemName: "keyboard.chevron.compact.down")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}

/**
 --------------------------
 NOTES:
 9.1 - 9.5 still reviewing focus state binding
 9.6 done reviewing focus state binding - but focus isn't working in the swiftuI preview for some reason, could be a bug. More important stuff to do so moving on
 9.6 jk it works as expected when i run it but not on the preview
 9.7 rebuilding login form on my own to practice focus state
 
 9.12   CountryRowView(country: country, isFocused: _isFocused) - i don't get why binding is passed like _ instead of $
 --------------------------
 UPDATES & QUESTIONS:
 */
