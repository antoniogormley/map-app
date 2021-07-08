//
//  LaunchView.swift
//  City Sights App
//
//  Created by Antonio Gormley on 07/07/2021.
//

import SwiftUI
import CoreLocation
struct LaunchView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        //detect the auth status of geolocating user
        if model.authorizationState == .notDetermined {
            //if undetermined show onboarding
            
            
        }
        else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {
            //if approved, show home view
            HomeView()
        }else{
            //if denied show error screen
            
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
