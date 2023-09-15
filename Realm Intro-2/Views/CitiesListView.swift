//
//  CitiesListView.swift
//  Realm Intro-2
//
//  Created by Noah Pope on 9/15/23.
//

import SwiftUI
import RealmSwift

struct CitiesListView: View {
    @ObservedRealmObject var country: Country
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesListView(country: Country(name: "Canada"))
    }
}
