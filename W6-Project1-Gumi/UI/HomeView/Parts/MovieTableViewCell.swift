//
//  MovieTableViewCell.swift
//  W6-Project1-Gumi
//
//  Created by Thành Nguyên on 20/04/2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        posterImageView.layer.cornerRadius = 10
    }
    
    //Receive data from parent and setup cell
    func bindData(movie: Movie) {
        posterImageView.loadFromURL(url: URL(string: "https://image.tmdb.org/t/p/w300\(movie.poster_path)")!)
        titleLabel.text = movie.title
        overviewTextView.text = movie.overview
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
