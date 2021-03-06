//
//  Profile.swift
//  omega-eCommerce
//
//  Created by Logan Nguyễn on 7/4/22.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    // Header
                    Text("My Profile")
                        .font(.custom(customFont, size: 28).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Profile Info
                    VStack(spacing: 15) {
                        
                        // Profile picture
                        Image("Profile_Picture")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .offset(y: -40)
                            .padding(.bottom, -40)
                        
                        // User Name
                        Text("Logan Nguyen")
                            .font(.custom(customFont, size: 16))
                            .fontWeight(.semibold)
                        
                        HStack(alignment: .top, spacing: 10) {
                            Image(systemName: "location.north.circle.fill")
                                .foregroundColor(.gray)
                                .rotationEffect(.init(degrees: 180))
                            
                            Text("Address: 15 Union Rd\nOswego\nNew York, USA")
                                .font(.custom(customFont, size: 15))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.horizontal, .bottom])
                    .background(Color.white.cornerRadius(12))
                    .padding()
                    .padding(.top, 40)
                    
                    // Custome Navigation Links
                    CustomNavigationLink(title: "Edit Profile") {
                        NavView(title: "Edit Profile")
                    }
                    
                    CustomNavigationLink(title: "Shopping Address") {
                        NavView(title: "Shopping Address")
                    }
                    
                    CustomNavigationLink(title: "Order history") {
                        NavView(title: "Order history")
                    }
                    CustomNavigationLink(title: "Cards") {
                        NavView(title: "Cards")
                    }
                    
                    CustomNavigationLink(title: "Notification") {
                        NavView(title: "Notification")
                    }
                }
                .padding(.horizontal, 22)
                .padding(.vertical, 20)
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.gray.opacity(0.4)
                    .ignoresSafeArea()
            )
        }
    }
    
    @ViewBuilder
    func NavView(title: String) -> some View {
        Text("")
            .navigationTitle(title)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("HomeBG").ignoresSafeArea())
    }
    
    // Avoiding new Structs...
    @ViewBuilder
    func CustomNavigationLink<Detail: View>(title: String,@ViewBuilder content: @escaping ()->Detail)->some View{
        
        
        NavigationLink {
            content()
        } label: {
            
            HStack{
                
                Text(title)
                    .font(.custom(customFont, size: 17))
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding()
            .background(
            
                Color.white
                    .cornerRadius(12)
            )
            .padding(.horizontal)
            .padding(.top,10)
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
