//
//  Movie.swift
//  BestMovies
//
//  Created by HaniMac on 19/03/2022.
//

import Foundation

struct Movie {
    public var idMovie: Int
    public var nameMovie: String
    public var dateMovie: String
    public var urlImageMovie: String
    public var descriptionMovie: String
    public var note: Double
    public var numberRatings: Int
    public var revenueMovie: Int
    
    init(_ dictionary: [String: Any]) {
        self.idMovie = dictionary["id"] as? Int ?? 0
        self.nameMovie = dictionary["title"] as? String ?? ""
        self.dateMovie = dictionary["release_date"] as? String ?? ""
        self.urlImageMovie = dictionary["poster_path"] as? String ?? ""
        self.descriptionMovie = dictionary["overview"] as? String ?? ""
        self.note = dictionary["vote_average"] as? Double ?? 0.0
        self.numberRatings = dictionary["vote_count"] as? Int ?? 0
        self.revenueMovie = dictionary["revenue"] as? Int ?? 0
    }
}

