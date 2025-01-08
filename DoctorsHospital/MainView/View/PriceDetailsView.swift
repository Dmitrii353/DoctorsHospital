//
//  PriceDetailsView.swift
//  DoctorsHospital
//
//  Created by Дима Люфт on 09.01.2025.
//

import SwiftUI

struct PriceDetailsView: View {
    var dataDoctors: User
   @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Видеоконсультация")
                        .font(.custom("Montserrat-Regular", size: 18))
                        .foregroundStyle(.black)
                        
                    Button {
                        //
                    } label: {
                        HStack{
                            Text("30 мин")
                                .font(.custom("Montserrat-Regular", size: 16))
                                .foregroundStyle(.black)
                            
                            Spacer()
                            
                            Text("\(dataDoctors.videoChatPrice ?? 0) ₽")
                                .font(.custom("Montserrat-Regular", size: 16))
                                .foregroundStyle(.black)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal,15)
                        .frame(height: 50)
                        .background(Color.white)
                        .clipShape(.rect(cornerRadius: 8))
                  
                    }
                }
                .padding(.bottom,20)
                
                VStack(alignment: .leading) {
                    Text("Чат с врачом")
                        .font(.custom("Montserrat-Regular", size: 18))
                        .foregroundStyle(.black)
                    
                    Button {
                        //
                    } label: {
                        HStack{
                            Text("30 мин")
                                .font(.custom("Montserrat-Regular", size: 16))
                                .foregroundStyle(.black)
                            
                            Spacer()
                            
                            Text("\(dataDoctors.videoChatPrice ?? 0) ₽")
                                .font(.custom("Montserrat-Regular", size: 16))
                                .foregroundStyle(.black)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal,15)
                        .frame(height: 50)
                        .background(Color.white)
                        .clipShape(.rect(cornerRadius: 8))
                    }
                }
                .padding(.bottom,20)
                
                VStack(alignment: .leading) {
                    Text("Приём в клинике")
                        .font(.custom("Montserrat-Regular", size: 18))
                        .foregroundStyle(.black)
                    
                    Button {
                        //
                    } label: {
                        HStack{
                            Text("В клинике")
                                .font(.custom("Montserrat-Regular", size: 16))
                                .foregroundStyle(.black)
                            
                            Spacer()
                            
                            Text("\(dataDoctors.videoChatPrice ?? 0) ₽")
                                .font(.custom("Montserrat-Regular", size: 16))
                                .foregroundStyle(.black)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal,15)
                        .frame(height: 50)
                        .background(Color.white)
                        .clipShape(.rect(cornerRadius: 8))
                        
                    }
                }
                .padding(.bottom,20)
            }
            .padding(.top,30)
            .padding(.horizontal,20)
        }
        .navigationTitle("Стоимость услуг")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.colorTabView)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.black)
                }
            }
        }
               
    }
}

