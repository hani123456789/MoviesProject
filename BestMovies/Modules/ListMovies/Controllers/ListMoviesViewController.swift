//
//  ListMoviesViewController.swift
//  BestMovies
//
//  Created by HaniMac on 19/03/2022.
//

import UIKit
import RxDataSources
import RxSwift

class ListMoviesViewController: UIViewController {
    @IBOutlet weak var listMoviesTableView: UITableView!
    
    private let disposeBag = DisposeBag()
    var viewModel: ListMoviesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        getMovies()
        setUpTableView()
        setupNavigationBar()

    }
    
    private func getMovies() {
        viewModel?.getMovies()
    }
    
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        // setup title font color
        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = titleAttribute
        navigationController?.navigationBar.topItem?.title = "List Movies"
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupBindings() {
        viewModel?.data.asObservable()
            .bind(to: listMoviesTableView.rx.items(cellIdentifier: "MovieDetailsTableViewCell", cellType: MovieDetailsTableViewCell.self)) {
                row, movie, cell in
                cell.configureCell(movie: movie)
                //MARK: cell configuration
                
            }.disposed(by: disposeBag)
        
        ///Handling table item selection
        listMoviesTableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                let idMovie = self?.viewModel?.data.value[indexPath.row].idMovie
                self?.showDetailsMovie(idMovie: idMovie ?? 0)
            })
            .disposed(by: disposeBag)
    }
    
    private func setUpTableView() {
        listMoviesTableView.rowHeight = 200
        listMoviesTableView.register(UINib.init(nibName: "MovieDetailsTableViewCell", bundle: Bundle(for: type(of: self))), forCellReuseIdentifier: "MovieDetailsTableViewCell")
    }
    
    private func showDetailsMovie(idMovie: Int) {
        let detailsViewController = DetailsMovieViewController()
        detailsViewController.viewModel = DetailsMovieViewModel(movieId:idMovie ,
                                                                moviesServices: MoviesService())
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
