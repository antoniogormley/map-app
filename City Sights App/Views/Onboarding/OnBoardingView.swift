//
//  OnBoardingView.swift
//  City Sights App
//
//  Created by Antonio Gormley on 09/07/2021.
//

import SwiftUI

struct OnBoardingView: View {
    @EnvironmentObject var model:ContentModel
    @State private var tabSelection = 0
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)

    
    var body: some View {
        VStack {
            TabView (selection: $tabSelection) {
                VStack (spacing:20){
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to City Sights!")
                        .bold()
                        .font(.title)
                    Text("City Sights helps you find the best of the city")

                    
                }
                .foregroundColor(.white)
                .tag(0)
                .padding()
                VStack (spacing:20){
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    Text("Ready to discover your city?")
                        .bold()
                        .font(.title)
                    Text("We'll show you the best restaurants, venues and more, based of your location!")
                    
                }
                .multilineTextAlignment(.center)
                .tag(1)
                .foregroundColor(.white)
                .padding()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            Button {
                if tabSelection == 0 {
                    tabSelection = 1
                }else{
                    model.requestGeoLocationPermission()
                }
            } label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    Text(tabSelection == 0 ? "Next":"Get my loccation")
                        .bold()
                        .padding()
                }
            }
            .accentColor(tabSelection == 0 ? blue : turquoise)
            .padding()
            Spacer()
        }
        .background(tabSelection == 0 ? blue : turquoise)
        .ignoresSafeArea(.all,edges: .all)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
