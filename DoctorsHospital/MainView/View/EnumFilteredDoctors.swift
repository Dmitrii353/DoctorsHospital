//
//  FilteredDoctors.swift
//  DoctorsHospital
//
//  Created by Дима Люфт on 03.01.2025.
//

import SwiftUI

enum SortedType: String, CaseIterable,Identifiable {
    case price = "По цене"
    case senority = "По стажу"
    case rating = "По рейтингу"
    
    var id: String { rawValue }
    
}



