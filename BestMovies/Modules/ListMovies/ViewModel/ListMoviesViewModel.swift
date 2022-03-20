//
//  ListMoviesViewModel.swift
//  BestMovies
//
//  Created by HaniMac on 19/03/2022.
//

import RxSwift
import RxCocoa

class ListMoviesViewModel {
    
    let data = BehaviorRelay<[Movie]>(value: [])
    var moviesServices: MoviesServiceProtocol
    private let disposeBag = DisposeBag()
    
    
    
    init(moviesServices : MoviesServiceProtocol) {
        self.moviesServices = moviesServices
    }
    
    func getMovies(){
        moviesServices.getListMovie(onCompletion: { (result) in
            if !result.isEmpty {
                self.data.accept(result)
            } else {
                
            }
        })
    }

}
