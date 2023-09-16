//
//  MainView.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI
import StoreKit

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isMenu = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "gear")
                                .foregroundColor(.white)
                                .font(.system(size: 19, weight: .semibold))
                        })
                    }
                    
                    HStack {
                        
                        Text("Main")
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .semibold))
                        
                        Spacer()
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        VStack(spacing: 15) {
                            
                            Text("Your income")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .regular))
                            
                            Text("$\(viewModel.transes.map(\.sum).reduce(0, +))")
                                .foregroundColor(.white)
                                .font(.system(size: 23, weight: .semibold))
                            
                            Text("Date: September")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        
                        HStack {
                            
                            ForEach(viewModel.categories, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.fetchTranses()
                                    viewModel.current_category = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(viewModel.current_category == index ? .white : .gray)
                                        .font(.system(size: 11, weight: .medium))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 30)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.current_category == index ? Color("primary") : .gray.opacity(0.2)))
                                })
                            }
                        }
                        
                        if viewModel.transes.isEmpty {
                            
                            HStack {
                                
                                Image("empty")
                                
                                VStack(alignment: .leading, content: {
                                    
                                    Text("Empty")
                                        .foregroundColor(.white)
                                        .font(.system(size: 21, weight: .semibold))
                                    
                                    Text("You don't have any added expenses yet")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                })
                                
                                Spacer()
                            }
                            .padding(.vertical)
                            
                        } else {
                            
                            ForEach(viewModel.transes, id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 10, content: {
                                        
                                        Text(index.category ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Text("$\(index.sum)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .semibold))
                                    })
                                    
                                    Spacer()
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            }
                        }
                    }
                    .padding()
                }
            }
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.isAdd = true
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            MainAdd(viewModel: viewModel)
        })
        .overlay (
        
            ZStack {
                
                Color.black.opacity(viewModel.isMenu ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isMenu = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Text("Settings")
                            .foregroundColor(.white)
                            .font(.system(size: 21, weight: .semibold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isMenu = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                                .padding(6)
                                .background(Circle().fill(.gray.opacity(0.2)))
                        })
                    }
                    .padding(.bottom)
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://docs.google.com/document/d/15yWAc89ulL4nEUvP7pjvORVAlTu-CKe6VBujAN1Om0o/edit?usp=sharing") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "doc.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Text("Usage Policy")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    })
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Text("Rate Us")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    })
                }
                .padding()
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color("bg").ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isMenu ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchTranses()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
