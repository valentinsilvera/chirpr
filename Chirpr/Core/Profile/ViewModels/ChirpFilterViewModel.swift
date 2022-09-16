//
//  ChirpFilterViewModel.swift
//  Chirpr
//
//  Created by Valentin Silvera on 16/9/22.
//

import Foundation

enum ChirpFilterViewModel: Int, CaseIterable {
    case chirps
    case replies
    case likes
    
    var title: String {
        switch self {
        case.chirps: return "Chirps"
        case.replies: return "Replies"
        case.likes: return "Likes"
        }
    }
}
