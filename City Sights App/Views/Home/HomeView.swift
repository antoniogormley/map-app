//
//  HomeView.swift
//  City Sights App
//
//  Created by Antonio Gormley on 07/07/2021.
//

import SwiftUI
struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    @State var selectedBusiness:Business?
    
    var body: some View {
        if model.restaurants.count != 0 ||  model.sights.count != 0 {
            
            NavigationView {
            
            if !isMapShowing  {
                //show list
                VStack (alignment: .leading) {
                    HStack {
                        Image(systemName: "location")
                        Text(model.placemark?.locality ?? "")
                        Spacer()
                        Button("Switch to map view") {
                            self.isMapShowing = true
                        }
                    }
                    Divider()
                    ZStack (alignment:.top){
                    BusinessList()
                        HStack{
                            Spacer()
                            YelpAttribution(link: "https://yelp.co.uk")
                        }.padding(.trailing, -20)
                    }
                    
                }
                .padding([.horizontal,.top])
                .navigationBarHidden(true)
            }else{
                
                ZStack(alignment: .top) {
                
                //show map
                BusinessMap(selectedBusiness: $selectedBusiness)
                    .ignoresSafeArea()
                    .sheet(item: $selectedBusiness) { business in
                        //create business detail view instance
                        //Pass in selected business
                        BusinessDetail(business: business)
                    }
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(height: 48)
                        HStack {
                            Image(systemName: "location")
                            Text(model.placemark?.locality ?? "")
                            Spacer()
                            Button("Switch to list view") {
                                self.isMapShowing = false
                            }
                        }
                        .padding()
                    }
                    .padding()
                }
            }
        }
        }else{
            ProgressView()

        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
