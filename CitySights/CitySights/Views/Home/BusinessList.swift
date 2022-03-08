//
//  BusinessList.swift
//  CitySights
//
//  Created by Тимофей Дудич on 8.03.22.
//

import SwiftUI

struct BusinessList: View {
    @EnvironmentObject var model:ContentModel
    var body: some View {
        ScrollView {
            //We can use pinnedViews with "section" inside so that Header or Footer
            //Will be sticked to the screen while scrolling (like "position:sticky" in CSS)
            LazyVStack(alignment:.leading, pinnedViews: [.sectionHeaders]) {
                //With the help of "section", we can specify footer and header of View block
                //As a header and footer we can pass any sort of View
                Section(header:BusinessSectionHeader(title: "Restaurants")) {
                    ForEach(model.restaurants) {res in
                        Text(res.name!)
                        Divider()
                    }
                }
                
                Divider()
                
                Section(header:BusinessSectionHeader(title: "Sights")) {
                    ForEach(model.sights) {sig in
                        Text(sig.name!)
                        Divider()
                    }
                }
            }
        }
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
