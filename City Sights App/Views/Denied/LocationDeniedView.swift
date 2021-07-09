//
//  LocationDeniedView.swift
//  City Sights App
//
//  Created by Antonio Gormley on 09/07/2021.
//

import SwiftUI

struct LocationDeniedView: View {
    let backgroundColor = Color(red: 34/255, green: 141/255, blue: 138/255)
    
    var body: some View {
        VStack  (spacing:20){
            Spacer()
            Text("Whoops!")
                .font(.title)
            Text("We need to access your location to provide you with best sights in the city. You can change your decision at any time in Settings.")
            Spacer()
            Button {
                
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
                
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height:48)
                        .cornerRadius(10)
                    Text("Go to setings")
                        .bold()
                        .foregroundColor(backgroundColor)
                    
                }
            }
            .padding()

            
            Spacer()
        }
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .background(backgroundColor)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
