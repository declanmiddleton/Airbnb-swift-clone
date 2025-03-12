//
//  ProfileView.swift
//  Airbnb
//
//  Created by Declan on 02/03/2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            // profile login
            VStack(alignment: .leading, spacing: 32){
                VStack (alignment: .leading, spacing: 8){
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Login to start planning your next trip!")
                }
                Button(action: {}, label: {
                    Text("Login")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: 300, height: 50)
                        .foregroundStyle(.primary)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                })
                
                HStack{
                    Text("Dont have an account?")
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                        .font(.caption)
                }
            }
            
            VStack(spacing: 24){
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                ProfileOptionRowView(imageName: "gear", title: "Accessability")
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the Help Center")

            }
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
