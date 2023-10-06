//
//  FlagPicker.swift
//  Realm Intro-2
//
//  Created by Noah Pope on 10/5/23.
//

import SwiftUI
import RealmSwift

struct FlagPicker: View {
    @ObservedRealmObject var country: Country
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    var searchResults: [CountryInfo] {
        if searchText.isEmpty {
            return CountryInfo.array
        } else {
            return CountryInfo.array.filter {$0.name.lowercased().contains(searchText.lowercased())}
        }
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FlagPicker_Previews: PreviewProvider {
    static var previews: some View {
        FlagPicker(country: Country(name: "Canada"))
    }
}
