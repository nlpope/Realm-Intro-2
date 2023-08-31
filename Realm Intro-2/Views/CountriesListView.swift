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
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
