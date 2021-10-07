//
//  FetchDataErrors.swift
//  FetchDataUinitTests
//
//  Created by Sebastian Maludziński on 05/10/2021.
//

import Foundation

enum FetchDataErrors: LocalizedError {
    case wrongURL
    case wrongServerResponse
    case decodingError
    
    var errorDescription: String? {
        switch self {
        case .wrongURL:
            return NSLocalizedString("URL is invalid", comment: "")
        case .wrongServerResponse:
            return NSLocalizedString("There was an error decoding the data!", comment: "")
        case .decodingError:
            return NSLocalizedString("Wrong server response!", comment: "")
        }
    }
}
