//
//  LoginScreen.swift
//  SwiftUI Auth
//
//  Created by Rezaul Islam on 7/5/24.
//

import SwiftUI

struct LoginScreen : View {
    @EnvironmentObject var authMgr : AuthManager
    var body: some View {
        VStack{
            Spacer()
            Text("Authenticator")
                .font(.title)
            
            switch authMgr.bioMetryType {
                
            case .touchID:
                Button("Auth with touch id") {
                    Task{
                        await authMgr.authWithBiometrics()
                    }
                }
                .buttonStyle(.bordered)
                
            case .faceID:
                Button("Auth with face id") {
                    Task{
                        await authMgr.authWithBiometrics()
                    }
                }
                .buttonStyle(.bordered)
                
            @unknown default:
                Button("Login with your crediential") {
                    
                }
                .buttonStyle(.bordered)
            }
            
            Spacer()
            
            Text("Auth: \(authMgr.isAuthenticate.description)")
            
            
        }
    }
}

#Preview{
    LoginScreen()
        .environmentObject(AuthManager())
}
