//
//  ContentView.swift
//  SwiftUI Auth
//
//  Created by Rezaul Islam on 7/5/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authMgr : AuthManager = AuthManager()
    var body: some View {
        VStack {
             LoginScreen()
        }
        .alert(isPresented: $authMgr.showAlert,
               content: {
            Alert(title: Text("Error"),
                  message: Text(authMgr.errorDescription?.description ?? ""),
                  dismissButton:.cancel(Text("OK")
                                       )
            )
        }
        )
        .padding()
        .environmentObject(authMgr)
    }
}

#Preview {
    ContentView()
}
