//
//  AuthManager.swift
//  SwiftUI Auth
//
//  Created by Rezaul Islam on 7/5/24.
//

import Foundation
import LocalAuthentication

class AuthManager : ObservableObject{
    private(set) var context = LAContext()
    @Published private(set) var bioMetryType : LABiometryType = .none
    private(set) var canEvalutePolicy = false
    @Published private(set) var isAuthenticate : Bool = false
    @Published var showAlert = false
    @Published private(set) var errorDescription: String?
    
    init(){
        getBiometryType()
    }
    
    func getBiometryType(){
        canEvalutePolicy = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        bioMetryType = context.biometryType
    }
    
    func authWithBiometrics() async{
        let reason = "Log into your account"
        do{
            let result = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
            if result{
                DispatchQueue.main.async {
                    self.isAuthenticate = true
                }
            }
        }catch{
            print(error.localizedDescription)
            self.errorDescription = error.localizedDescription
            showAlert = true
            self.bioMetryType = .none
        }
    }
    
}
