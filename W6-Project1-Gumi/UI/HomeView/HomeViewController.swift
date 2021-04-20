//
//  HomeViewController.swift
//  W6-Project1-Gumi
//
//  Created by Thành Nguyên on 20/04/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var spinnerActivityIndicatorView: UIActivityIndicatorView!
    
    lazy var viewModel = HomeViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        title = "Home"
        
        movieTableView.register(MovieTableViewCell.nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
        movieTableView.dataSource = self
        movieTableView.delegate = self
        
        viewModel.getData()
    }

}

extension HomeViewController: HomeViewModelEvents {
    func startProccessing() {
        spinnerActivityIndicatorView.isHidden = false
        spinnerActivityIndicatorView.startAnimating()
    }
    
    func finishProccessing() {
        spinnerActivityIndicatorView.stopAnimating()
        movieTableView.reloadData()
    }
    
    func error(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listOfMovie.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        cell.bindData(movie: viewModel.listOfMovie[indexPath.row])
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
