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
    @State private var presentAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                if countries.isEmpty {
                    Text("Tap on the \(Image(systemName: "plus.circle.fill")) button above to create a new Country.")
                } else {
                    List {
                        ForEach(countries.sorted(byKeyPath: "name")) { country in
                            NavigationLink {
                                CitiesListView(country: country)
                                //nav destination
                            } label: {
                                CountryRowView(country: country, isFocused: _isFocused)
                            }
                        }
                        .onDelete(perform: deleteCountry)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
                Spacer()
            }
            .animation(.default, value: countries)
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
        .alert("you must first delete all cities within this country", isPresented: $presentAlert, actions: {})
    }
    
    func deleteCountry(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let selectedCountry = Array(countries.sorted(byKeyPath: "name"))[index]
        guard selectedCountry.cities.isEmpty else {
            //show alert msg
            presentAlert.toggle()
            return
        }
        $countries.remove(selectedCountry)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}


