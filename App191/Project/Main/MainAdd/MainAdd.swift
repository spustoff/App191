//
//  MainAdd.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI

struct MainAdd: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("New Account")
                        .foregroundColor(.white)
                        .font(.system(size: 21, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                            .padding(6)
                            .background(Circle().fill(.gray.opacity(0.2)))
                    })
                }
                .padding()
                .padding(.top)
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack(spacing: 40) {
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Category")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                            
                            HStack {
                                
                                ForEach(viewModel.categories, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.current_category = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(viewModel.current_category == index ? .white : .gray)
                                            .font(.system(size: 11, weight: .medium))
                                            .padding(.horizontal)
                                            .frame(height: 30)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.current_category == index ? Color("primary") : .gray.opacity(0.2)))
                                    })
                                }
                                
                                Spacer()
                            }
                        })
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.name.isEmpty ? 1 : 0)
                                    
                                TextField("", text: $viewModel.name)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        })
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Sum")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.sum.isEmpty ? 1 : 0)
                                    
                                TextField("", text: $viewModel.sum)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        })
                        
                        Button(action: {
                            
                            viewModel.addTrans {
                                
                                viewModel.fetchTranses()
                                router.wrappedValue.dismiss()
                            }
                            
                        }, label: {
                            
                            Text("Create")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        })
                        .opacity(viewModel.name.isEmpty || viewModel.sum.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.name.isEmpty || viewModel.sum.isEmpty ? true : false)
                    }
                    .padding()
                }
            }
        }
    }
}

struct MainAdd_Previews: PreviewProvider {
    static var previews: some View {
        MainAdd(viewModel: MainViewModel())
    }
}
