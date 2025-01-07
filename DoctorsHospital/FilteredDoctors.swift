//
//  FilteredDoctors.swift
//  DoctorsHospital
//
//  Created by Дима Люфт on 03.01.2025.
//

import SwiftUI

enum SortedType: String, CaseIterable {
    case price = "По цене"
    case senority = "По стажу"
    case rating = "По рейтингу"
    
}

struct FilteredDoctors: View {
    var criteries: String
    var body: some View {
        HStack {
            Button {
                //
            } label: {
                Text(criteries)
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundStyle(.white)
            }
            
           

        }
    }
}


