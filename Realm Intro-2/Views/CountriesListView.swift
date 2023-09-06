//
//  ContentView.swift
//  Realm Intro-2
//
//  Created by Stewart Lynch on 2022-03-07.
//

import SwiftUI
import RealmSwift

struct CountriesListView: View {
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
                            CountryRowView(country: country)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
                Spacer()
            }
            .navigationTitle("Countriez")
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

 --------------------------
 UPDATES & QUESTIONS:
 */
