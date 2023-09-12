//
//  ProfileView.swift
//  Catsnaps
//
//  Created by keet on 10.09.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("idk")
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            VStack {
                                Text("Profile")
                                    .font(.system(size: 24, weight: .bold, design: .rounded))
                                    .foregroundColor(Color.black)
                            }
                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink(destination: SettingView()) {
                                Image("gear")
                                    .foregroundStyle(.black)
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    ProfileView()
}
