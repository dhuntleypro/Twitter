//
//  Message.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/20/21.
//

import SwiftUI

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

// Data source
let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "spiderman", messageText: "Hey what's up", isCurrentUser: false),
    .init(id: 1, imageName: "batman", messageText: "Not much, you?", isCurrentUser: true),
    .init(id: 2, imageName: "batman", messageText: "Hows the marvel Universe?", isCurrentUser: true),
    .init(id: 3, imageName: "spiderman", messageText: "It's pretty good dude", isCurrentUser: false),
    .init(id: 4, imageName: "spiderman", messageText: "How's your battle with thejoker", isCurrentUser: false),
    .init(id: 5, imageName: "batman", messageText: "Not going so well..", isCurrentUser: true),

]
