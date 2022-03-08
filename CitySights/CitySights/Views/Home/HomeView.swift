//
//  HomeView.swift
//  CitySights
//
//  Created by Тимофей Дудич on 8.03.22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model:ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        if model.restaurants.count != 0 || model.sights.count != 0 {
            if isMapShowing == false {
                //Show list
                VStack {
                    HStack {
                        Image(systemName: "location")
                        Text("Prague")
                        Spacer()
                        Text("Switch to the map view")
                    }
                    Divider()
                    BusinessList()
                }.padding()
            }
            else {
                //Show map
            }
        }
        else {
            ProgressView()
        }
    }
}


