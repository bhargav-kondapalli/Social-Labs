//
//  DataServices.swift
//  Social-Labs
//
//  Created by Bhargav Kondapalli on 10/12/16.
//  Copyright © 2016 KikrLabs. All rights reserved.
//

import Foundation
import Firebase

let DB_Base = FIRDatabase.database().reference()

class DataService {
    static let ds = DataService() // Create Singleton
    
    private var _REF_BASE = DB_Base
    private var _REF_POSTS = DB_Base.child("posts")
    private var _REF_USERS = DB_Base.child("users")
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: FIRDatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }

    
    
    
}
