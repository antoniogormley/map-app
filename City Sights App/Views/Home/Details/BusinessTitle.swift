//
//  BusinessTitle.swift
//  City Sights App
//
//  Created by Antonio Gormley on 09/07/2021.
//

import SwiftUI

struct BusinessTitle: View {
    var  business:Business
    var body: some View {
        VStack (alignment:.leading){
        Text(business.name!)
            .font(.largeTitle)
        if business.location?.displayAddress != nil {
            ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                Text(displayLine)
            }
        }
        Image("regular_\(business.rating ?? 0)")
        }
    }
}

