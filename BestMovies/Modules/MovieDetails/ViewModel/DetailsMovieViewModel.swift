//
//  DetailsMovieViewModel.swift
//  BestMovies
//
//  Created by HaniMac on 20/03/2022.

import RxSwift
import RxCocoa

class DetailsMovieViewModel {
    
    let data = BehaviorRelay<Movie?>(value: nil)
    var moviesServices: MoviesServiceProtocol
    var movieId: Int
    private let disposeBag = DisposeBag()
    
    init(movieId: Int, moviesServices: MoviesServiceProtocol) {
        self.moviesServices = moviesServices
        self.movieId = movieId
    }
    
    func getDetailsOfMovie() {
        moviesServices.getDetailsOfMovie(movieId: movieId, onCompletion: { (result) in
            self.data.accept(result)
        })
    }
}
