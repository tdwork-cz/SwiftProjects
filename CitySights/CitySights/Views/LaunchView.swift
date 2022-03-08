//
//  LaunchView.swift
//  CitySights
//
//  Created by Тимофей Дудич on 4.03.22.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        if model.authorizationState == .notDetermined {
            //If undetermined, show onboarding
        }
        else if model.authorizationState == .authorizedWhenInUse ||
                    model.authorizationState == .authorizedAlways {
            //If approved, show home view
            HomeView()
        }
        else {
            //If denied show error screen
            
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
