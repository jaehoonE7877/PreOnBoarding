//
//  RandomPhoto.swift
//  PerOnBoarding
//
//  Created by Seo Jae Hoon on 2023/02/22.
//

import Foundation

// MARK: - Result
struct RandomPhoto: Codable, Hashable {

    let urls: Urls

    enum CodingKeys: String, CodingKey {
        case urls
    }
}

struct Urls: Codable, Hashable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}
