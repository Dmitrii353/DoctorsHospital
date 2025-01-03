//
//  ContentView.swift
//  DoctorsHospital
//
//  Created by Дима Люфт on 30.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State var vm = MainViewModel()
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack(spacing: 0) {
                        ForEach(SortedType.allCases, id: \.self) { sorting in
                            Button {
                                //
                            } label: {
                                Text(sorting.title)
                                    .font(.custom("Montserrat-Regular", size: 14))
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical,10)
                                    .clipped()
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 0)
                                    .stroke(Color(.systemGray6), lineWidth: 0.5))
                            .background(Color(.pearchPink))
                            
                        }
                        
                    }
                    .clipShape(.rect(cornerRadius: 8))
                    
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Педиатры")
                        .font(.custom("Montserrat-Regular", size: 20))
                    
                }
            }
            .searchable(text: $vm.searchText, prompt: "Поиск")
            
        }
        
        
    }
    
}

#Preview {
    ContentView()
}
