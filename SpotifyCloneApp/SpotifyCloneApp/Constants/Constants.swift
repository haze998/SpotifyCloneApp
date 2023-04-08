//
//  Constants.swift
//  SpotifyCloneApp
//
//  Created by Evgeniy Docenko on 08.04.2023.
//

import Foundation

enum FontNames: String {
    case robotoBold = "Roboto-Bold"
    case robotoMedium = "Roboto-Medium"
    case robotoRegular = "Roboto-Regular"
}

enum ConstantsURL: String {
    case base = "https://accounts.spotify.com/authorize"
    case scopes = "user-read-private%20playlist-modify-public%20playlist-read-private%20playlist-modify-private%20user-follow-read%20user-library-modify%20user-library-read%20user-read-email"
    case tokenAPIURL = "https://accounts.spotify.com/api/token"
}
