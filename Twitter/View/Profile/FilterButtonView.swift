//
//  FilterButtonView.swift
//  Twitter
//
//  Created by Darrien Huntley on 1/20/21.
//

import SwiftUI

// Options | Custom Picker view
enum TweetFilterOptions: Int , CaseIterable {
    // with Int (array Int) - it assigns each case a value starting for 0 like an array
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        
        case .tweets: return "Tweeets"
        case .replies: return "Tweets and Replies"
        case .likes: return "Likes"
        }
    }
}

struct FilterButtonView: View {
    @Binding var selectedOption: TweetFilterOptions
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(TweetFilterOptions.allCases.count)
    
    private var padding :CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue) //
        let count = CGFloat(TweetFilterOptions.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue ) + 16
        // ((total width of the screen / number of cases) * the array Int ) + 16 padding
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(TweetFilterOptions.allCases, id: \.self) {  option in
                    Button(action: {
                        self.selectedOption = option
                    }, label: {
                        Text(option.title)
                            .font(.system(size: 14 , weight: .bold))
                            .frame(width: underlineWidth - 5) // 8
                            
                            
                    })
                }
            }
            Rectangle()
                .frame(width: underlineWidth - 32, height: 3 , alignment: .center)
                .foregroundColor(.blue)
                .padding(.leading, padding)
                .animation(.spring())
        }
    }
}

struct FilterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtonView(selectedOption: .constant(.likes))
    }
}
