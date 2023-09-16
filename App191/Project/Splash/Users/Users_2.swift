//
//  Users_2.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI
import StoreKit

struct Users_2: View {
    
    let telegram: URL
    let isContacts: Bool
    let isTelegram: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    VStack(spacing: 7, content: {
                        
                        Text("Rate us in the AppStore")
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Make the app even better")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding(.horizontal)
                    .padding(.bottom, 130)
                    
                    NavigationLink(destination: {
                        
                        if isTelegram == true {
                            
                            Users_3(telegram: telegram, isContacts: isContacts)
                                .navigationBarBackButtonHidden()
                            
                        } else if isTelegram == false {
                            
                            if isContacts == true {
                                
                                Users_4()
                                    .navigationBarBackButtonHidden()
                                
                            } else if isContacts == false {
                                
                                Users_5()
                                    .navigationBarBackButtonHidden()
                            }
                        }
                        
                    }, label: {
                        
                        Text("Continue")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                    })
                }
                .padding(.top)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color("bg").ignoresSafeArea())
            }
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

struct Users_2_Previews: PreviewProvider {
    static var previews: some View {
        Users_2(telegram: URL(string: "h")!, isContacts: false, isTelegram: false)
    }
}
