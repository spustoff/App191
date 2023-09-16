//
//  CalendarView.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI

struct CalenderView: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = CalendarViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Holiday Calendar")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Back")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .medium))
                            }
                        })
                        
                        Spacer()
                        
                    }
                }
                .padding()
                
                
                if viewModel.isLoading {
                    
                    ProgressView()
                        .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    if viewModel.calendar_items.isEmpty {
                        
                        VStack {
                            
                            Text("empty")
                                .foregroundColor(.white)
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.calendar_items, id: \.self) { index in
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Text(index.resultCurrencyItem ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .semibold))
                                            
                                            Spacer()
                                            
                                            Text(index.resultCreated_atItem ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .frame(width: 130)
                                                .lineLimit(1)
                                        }
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 5) {
                                                
                                                Text("Buy")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text("\(index.resultBuyItem ?? 0)")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16, weight: .semibold))
                                            }
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .leading, spacing: 5) {
                                                
                                                Text("Sell")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text("\(index.resultSellItem ?? 0)")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16, weight: .semibold))
                                            }
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .leading, spacing: 5) {
                                                
                                                Text("ID")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text("\(index.resultIdItem ?? 0)")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16, weight: .semibold))
                                            }
                                        }
                                        
                                        HStack {
                                            
                                            Spacer()
               
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                            
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                    .padding(.horizontal)
                                    
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.getCalendar()
        }
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}
