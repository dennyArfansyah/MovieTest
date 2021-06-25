//
//  DetailMovieController.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 25/06/21.
//

import UIKit
import youtube_ios_player_helper
import Toast_Swift

class DetailMoviewController: UIViewController, YTPlayerViewDelegate {
    
    lazy var youtubePlayer = YTPlayerView()
    lazy var titleLabel = UILabel()
    lazy var releaseLabel = UILabel()
    lazy var overviewLabel = UILabel()
    
    lazy var scrollView = UIScrollView()
    lazy var mainView = UIView()
    lazy var reviewButton = UIButton()
    var movie: Movie!
    
    init(movie: Movie) {
        super.init(nibName: nil, bundle: nil)
        self.movie = movie
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        youtubePlayer.delegate = self
        
        let url = URL(string: String(format: "%@/%d/videos?api_key=%@", Constants.movieUrl, movie.id, Constants.apiKey))!
        Service().request(with: url, method: .get, parameter: nil) { response in
            switch response {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(Videos.self, from: data)
                    if let results = decodedData.results, results.count > 0 {
                        for video in results {
                            if video.type?.lowercased() == "trailer" {
                                let key = video.key ?? ""
                                self.setYoutubeKey(with: key)
                                break
                            }
                        }
                    }
                } catch {
                    self.view.makeToast(error.localizedDescription)
                }
            case .failure(let err):
                let er = err as NSError
                print("FAILURE", er.domain)
                self.view.makeToast(er.domain)
            }
        }
    }
    
    func setYoutubeKey(with key: String) {
        DispatchQueue.main.async {
            self.youtubePlayer.load(withVideoId: key, playerVars: ["playsinline": 1])
        }
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        youtubePlayer.playVideo()
    }
    
    @objc func reviewButtonPressed() {
        let controller = ReviewController(movie: movie)
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
