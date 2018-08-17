//
//  AuthService.swift
//  breakPoint
//
//  Created by Stephen Reyes on 8/16/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import Foundation
import Firebase



class AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping(_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            guard let authDataResult = authDataResult else {
                userCreationComplete(false, error)
                return
            }
            
            let userData = ["provider": authDataResult.user.providerID, "email" : authDataResult.user.email]
            DataService.instance.createUser(uid: authDataResult.user.uid, userdata: userData)
            userCreationComplete(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping(_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            guard let authDataResult = authDataResult else {
                loginComplete(false, error)
                return
            }
            loginComplete(true, nil)
        }
    }
}
















