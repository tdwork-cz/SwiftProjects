//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Тимофей Дудич on 22.02.22.
//

import SwiftUI

struct HomeViewRow: View {
    var image:String
    var title:String
    var description:String
    var count:String
    var time:String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
        //It will take all affordable space, whle mantaining these sizes
        //These sizes are accoording to the full screen, not to the parrent container
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack {
                //Image
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                Spacer()
                //Text
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .bold()
                    Text(description)
                        .padding(.bottom)
                        .font(Font.system(size:15))
                    HStack {
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(count)
                            .font(Font.system(size: 10))
                        Spacer()
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(.caption)
                    }
                }
                .padding(.leading, 10)
            }.padding(.horizontal, 20.0)
        }
        
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Learning Swift", description: "some description", count: "20 Lessons", time: "3 Hours")
    }
}
