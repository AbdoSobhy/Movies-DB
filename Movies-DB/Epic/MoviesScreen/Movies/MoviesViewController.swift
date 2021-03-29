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

    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var moviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hideViews()
        bindTableView()
        presenter?.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        animateViews()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    func bindTableView(){
        self.presenter?.moviesObserver.bind(to: moviesTableView.rx.items(cellIdentifier: "MovieTableViewCell", cellType: MovieTableViewCell.self)) {(row, movie, cell) in
            cell.configure(cell: ResultViewModel(movieResult: movie))
        }.disposed(by: disposeBag)
    }
    
    func hideViews(){
        let transformRotate = CGAffineTransform(rotationAngle: -90)
        self.titleLbl.transform = transformRotate
    }
    
    func animateViews(){
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2) {
                self.titleLbl.transform = .identity
            }
        }
    }
    
}


