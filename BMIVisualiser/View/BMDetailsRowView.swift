//
//  BMDetailsRowView.swift
//  BMIVisualiser
//
//  Created by Manasi Kulkarni on 22/07/20.
//  Copyright © 2020 Manasi Kulkarni. All rights reserved.
//

import SwiftUI

struct BMDetailsRowView: View {
    var detail : BMDetails?
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        HStack {
            Text("\(detail?.bmi ?? "") on \(detail?.dateOfEvaluation ?? Date(), formatter: dateFormatter)")
        }
    }
}

struct BMDetailsRowView_Previews: PreviewProvider {
    static var previews: some View {
        BMDetailsRowView(detail: nil)
    }
}
