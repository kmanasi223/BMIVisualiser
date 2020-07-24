//
//  BMIGraph.swift
//  BMIVisualiser
//
//  Created by Manasi Kulkarni on 22/07/20.
//  Copyright © 2020 Manasi Kulkarni. All rights reserved.
//

import SwiftUI

struct BMIGraph: View {
    var details : Set<BMDetails>?
    
    var detailsArray: [BMDetails] {
        if let items = details {
            return Array(items)
        }
        return [BMDetails]()
    }
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            ProfileHeaderView(title: "List of BMIs till date")
            List(detailsArray, id: \.self) { item in
                BMDetailsRowView(detail: item)
            }
            Button(action: {
                self.isPresented = false
            }) {
                Text("Close")
            }
        }
    }
}

struct BMIGraph_Previews: PreviewProvider {
    static var previews: some View {
        return BMIGraph(details: nil, isPresented: .constant(true))
    }
}
