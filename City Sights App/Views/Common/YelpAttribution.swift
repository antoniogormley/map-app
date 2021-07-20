//
//  YelpAttribution.swift
//  City Sights App
//
//  Created by Antonio Gormley on 09/07/2021.
//

import SwiftUI

struct YelpAttribution: View {
    
    var link:String
    
    var body: some View {
        Link (destination: URL(string: link)!) {
            Image("yelp")
            .resizable()
            .scaledToFit()
            .frame(height:36)
            
            
        }
    }
}

