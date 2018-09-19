//
//  DataService.swift
//  breakPoint
//
//  Created by Stephen Reyes on 8/14/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import Foundation
import Firebase


let DB_BASE = Database.database().reference()

class DataService {
    
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    func createUser(uid: String, userdata: Dictionary<String, Any> ) {
        REF_USERS.child(uid).updateChildValues(userdata)
    }
    func uploadPost(withMessage message: String, forUID uid: String, forGroupKey groupKey: String?, sendComplete: @escaping ( _ status: Bool) ->()) {
        if groupKey != nil {
            //send group ref
        } else {
            REF_FEED.childByAutoId().updateChildValues(["content": message, "senderId": uid])
            sendComplete(true)
        }
    }
    
    func getAllFeedMessages(handler: @escaping (_ messages: [Message]) -> ()) {
        var messageArray = [Message]()
        REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for message in feedMessageSnapshot {
                
                if let content = message.childSnapshot(forPath: "content").value as? String {
                if let senderId = message.childSnapshot(forPath: "senderId").value as? String {
                    let message = Message(content: content, senderId: senderId)
                    messageArray.append(message)
                    }
                }
            }
            print("success")
            handler(messageArray)
        }
    }
    
    
    
}















