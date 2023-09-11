//
//  SettingView.swift
//  Catsnaps
//
//  Created by keet on 10.09.2023.
//

import SwiftUI
import AlertToast

struct SettingView: View {
    var body: some View {
        NavigationStack {
            VStack {
                TitleView()
                
                HStack {
                    AccountSectionView()
                        .padding(.leading)
                    PrivacySectionView()
                        .padding(.trailing)
                }
                
                AboutAppView()
            }
        }
    }
}

#Preview {
    SettingView()
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack() {
                Text("Settings")
                    .padding()
                    .font(.system(size: 36, weight: .light, design: .rounded))
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                print("there is no spoon")
                            } label: {
                                Image("door.chevron.left")
                            }
                        }
                    }
                Spacer()
            }
        }
    }
}

struct AvatarView: View {
    var body: some View {
        HStack {
            Image("avatar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 46, height: 46)
                .clipShape(Circle())
                .overlay {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 12, height: 12)
                                .background(Color.black)
                                .clipShape(Circle())
                                .overlay {
                                    Circle()
                                        .stroke(.white, lineWidth: 2)
                                }
                        }
                    }
                }
        }
    }
}

struct AccountSectionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AvatarView()
                Spacer()
                VStack(alignment: .leading) {
                    Image("pen.line")
                        .font(.system(size: 24))
                        .padding(.bottom, 20)
                }
            }
            .padding(.bottom, 25)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Keet")
                        .font(.system(size: 16, weight: .semibold))
                    
                    Text("Your account")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 110)
        .padding(16)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(red: 0.71, green: 0.78, blue: 0.81), lineWidth: 1)
        }
        .padding(.vertical)
    }
}

struct PrivacySectionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Image("lock.unlocked")
                        .font(.system(size: 24))
                }
            }
            .padding(.bottom, 45)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Privacy")
                        .font(.system(size: 16, weight: .semibold))
                    
                    Text("Security & devices")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 110)
        .padding(16)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(red: 0.71, green: 0.78, blue: 0.81), lineWidth: 1)
        }
    }
}

struct AboutAppView: View {
    
    @State private var showToast = false
    @State var count = 0
    
    let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("About app")
                    .font(.system(size: 16, weight: .semibold))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top)
            .padding(.bottom, 16)
            
            HStack {
                HStack {
                    Image("applogo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text("CatSnaps")
                            .font(.system(size: 16, weight: .semibold))
                        
                        Text("v\(appVersion ?? "Unknown")")
                            .font(.system(size: 16))
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(16)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(red: 0.71, green: 0.78, blue: 0.81), lineWidth: 1)
                }
                .padding(.horizontal)
            }
            .onTapGesture {
                count += 1
                
                if count == 10 {
                    print("asdas")
                    showToast.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                        showToast.toggle()
                    }
                }
            }
            .toast(isPresenting: $showToast) {
                AlertToast(displayMode: .hud, type: .regular, title: "Ok but why...")
            }
            
            Spacer()
        }
    }
}
