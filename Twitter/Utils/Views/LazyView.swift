//
//  LazyView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/30/21.
//

import SwiftUI


// We are only going to load a particular set of content when it comes into view ( LAZY LOADING )
struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
