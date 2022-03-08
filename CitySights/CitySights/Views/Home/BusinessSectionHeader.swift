//
//  BusinessSectionHeader.swift
//  CitySights
//
//  Created by Тимофей Дудич on 8.03.22.
//

import SwiftUI

struct BusinessSectionHeader: View {
    var title:String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
            
            Text(title)
                .font(.headline)
        }
    }
}

struct BusinessSectionheader_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSectionHeader(title: "Restaurants")
    }
}
