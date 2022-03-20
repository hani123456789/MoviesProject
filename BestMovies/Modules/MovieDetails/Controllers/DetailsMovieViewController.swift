//
//  DetailsMovieViewController.swift
//  BestMovies
//
//  Created by HaniMac on 20/03/2022.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class DetailsMovieViewController: UIViewController {
    @IBOutlet weak var nameMovieLabel: UILabel!
    @IBOutlet weak var globalStack: UIStackView!
    @IBOutlet weak var dateMovieLabel: UILabel!
    @IBOutlet weak var noteMovieLabel: UILabel!
    @IBOutlet weak var revenueMovieLabel: UILabel!
    @IBOutlet weak var descriptionMovieLabel: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    @IBOutlet weak var backButton: UIButton!
    
    var viewModel: DetailsMovieViewModel?
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetailsMovie()
        setUpBindings()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    

    
    private func getDetailsMovie() {
        spinnerView.startAnimating()
        viewModel?.getDetailsOfMovie()
    }
    
    private func setUpBindings() {
        viewModel?.data.asObservable().skip(while: { $0 == nil })
            .subscribe(onNext: { [weak self] movie in
                DispatchQueue.main.async {
                    self?.setupInformations(movie: movie!)
                }
            })
            .disposed(by: disposeBag)
        
        backButton.rx.tap.bind { [weak self] _ in self?.backToList() }
        .disposed(by: disposeBag)
    }
    
    private func setupInformations(movie: Movie) {
        spinnerView.isHidden = true
        globalStack.isHidden = false
        nameMovieLabel.text = movie.nameMovie
        dateMovieLabel.text = movie.dateMovie
        descriptionMovieLabel.text = movie.descriptionMovie
        revenueMovieLabel.text = String(movie.revenueMovie)
        noteMovieLabel.text = "\(movie.note) (\(movie.numberRatings))"
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.urlImageMovie)")
        imageMovie.kf.setImage(with: url)
    }
    
    private func backToList() {
        self.navigationController?.popViewController(animated: true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
