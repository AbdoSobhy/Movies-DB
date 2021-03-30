//
//  MovieDetailsViewController.swift
//  Movies-DB
//
//  Created Abdelrahman Sobhy on 3/10/21.
//  Copyright © 2021 . All rights reserved.
//


import UIKit
import RxCocoa
import RxSwift

class MovieDetailsViewController: UIViewController, MovieDetailsView {
    var presenter: MovieDetailsPresenter?
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var voteAvg: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var overviewLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.presenter?.viewDidLoad()
        self.backBtnAction()
        self.dataSubscription()
    }
    
    func backBtnAction(){
        self.backBtn.rx.tap.throttle(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance).subscribe(onNext: {
            self.navigationController?.popViewController(animated: true)
        }).disposed(by: disposeBag)
    }
    
    func dataSubscription(){
        self.presenter?.movieDetails.subscribe(onNext: { movie in
            self.setData(movie: movie)
        }).disposed(by: disposeBag)
    }
    
    func setData(movie: MovieDetailsViewModel) {
        self.backdropImage.kf.setImage(with: URL(string: movie.backdropPath))
        self.titleLbl.text = movie.title
        self.posterImage.kf.setImage(with: URL(string: movie.posterPath))
        self.voteAvg.text = "\(movie.voteAverage)"
        self.releaseDate.text = movie.releaseDate
        self.overviewLbl.text = movie.overview
    }
}


