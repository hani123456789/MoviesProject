//
//  MoviesServiceProtocol.swift
//  BestMovies
//
//  Created by HaniMac on 19/03/2022.
//

protocol MoviesServiceProtocol {
    func getListMovie(onCompletion:@escaping([Movie])->())
    func getDetailsOfMovie(movieId: Int ,onCompletion: @escaping (Movie?) -> ())
}
