//
//  ChatBubble.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/20/21.
//

import SwiftUI

struct ChatBubble: Shape {
    var isFromCurrentUser: Bool

    // rounds the corner of the user who is not the current user
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight , isFromCurrentUser ? .bottomLeft: .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        return Path(path.cgPath)
    }
    

}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isFromCurrentUser: false)
    }
}
