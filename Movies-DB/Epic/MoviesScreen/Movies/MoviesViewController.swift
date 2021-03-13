//
//  MoviesViewController.swift
//  Movies-DB
//
//  Created Abdelrahman Sobhy on 3/10/21.
//  Copyright © 2021 . All rights reserved.
//


import UIKit
import RxCocoa
import RxSwift

class MoviesViewController: UIViewController, MoviesView {
    var presenter: MoviesPresenter?
    var disposeBag = DisposeBag()

    
    @IBOutlet weak var moviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindTableView()
        presenter?.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    func bindTableView(){
        self.presenter?.moviesObserver.bind(to: moviesTableView.rx.items(cellIdentifier: "MovieTableViewCell", cellType: MovieTableViewCell.self)) {(row, movie, cell) in
            cell.configure(cell: ResultViewModel(movieResult: movie))
        }.disposed(by: disposeBag)
    }
    
}


