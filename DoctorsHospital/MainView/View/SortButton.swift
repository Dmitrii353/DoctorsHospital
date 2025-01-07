//
//  SortButton.swift
//  DoctorsHospital
//
//  Created by Дима Люфт on 08.01.2025.
//

import SwiftUI

struct SortView: View {
    @ObservedObject var vm: MainViewModel
    @Binding var sortedType: SortedType
    var onSortChanged: () -> Void

    var body: some View {
        HStack(spacing: 0) {
            ForEach(SortedType.allCases, id: \.self) { sort in
                SortButton(
                    sort: sort,
                    isSelected: sortedType == sort,
                    isAscending: vm.isAscending,
                    onTap: {
                        if sortedType == sort {
                            vm.isAscending.toggle()
                        } else {
                            sortedType = sort
                            vm.isAscending = true
                        }
                        onSortChanged()
                    }
                )
            }
        }
    }
}

struct SortButton: View {
    let sort: SortedType
    let isSelected: Bool
    let isAscending: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 5) {
                Text(sort.rawValue)
                    .font(.custom("Montserrat-Regular", size: 14))
                    .foregroundColor(isSelected ? .white : .gray)

                if isSelected {
                    Image(systemName: isAscending ? "arrow.up" : "arrow.down")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                }
            }
            
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
           
        }
        .overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(Color(.systemGray6), lineWidth: 0.5))
        .background(isSelected ? Color(.pearchPink) : Color(.systemGray6))
        .clipShape(roundedCorners(for: sort))

    }
}

private func roundedCorners(for sorting: SortedType) -> some Shape {
       let index = SortedType.allCases.firstIndex(of: sorting) ?? 0
       let isFirst = index == 0
       let isLast = index == SortedType.allCases.count - 1

       if isFirst {
           return AnyShape(RoundedCorner(radius: 8, corners: [.topLeft, .bottomLeft]))
       } else if isLast {
           return AnyShape(RoundedCorner(radius: 8, corners: [.topRight, .bottomRight]))
       } else {
           return AnyShape(Rectangle())
       }
   }


/// Кастомная структура для закругленных углов
struct RoundedCorner: Shape {
   var radius: CGFloat
   var corners: UIRectCorner

   func path(in rect: CGRect) -> Path {
       let path = UIBezierPath(
           roundedRect: rect,
           byRoundingCorners: corners,
           cornerRadii: CGSize(width: radius, height: radius)
       )
       return Path(path.cgPath)
   }
}
