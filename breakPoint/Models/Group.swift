//
//  Group.swift
//  breakPoint
//
//  Created by Stephen Reyes on 10/15/18.
//  Copyright © 2018 Stephen Reyes. All rights reserved.
//

import Foundation

class Group {
    private var _grouptTitle: String
    private var _groupDesc: String
    private var _key: String
    private var _memberCount: Int
    private var _members: [String]
    
    var groupTitle: String {
        return _grouptTitle
    }
    var groupDesc: String {
        return _groupDesc
    }
    var key: String {
        return _key
    }
    var memberCount: Int {
        return _memberCount
    }
    var members: [String] {
        return _members
    }
    
    init(groupTitle: String, groupDesc: String, key: String, memberCount: Int, members:[String]) {
        self._grouptTitle = groupTitle
        self._groupDesc = groupDesc
        self._key = key
        self._memberCount = memberCount
        self._members = members
    }
    
}
