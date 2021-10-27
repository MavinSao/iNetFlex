//
//  MovieCollectionViewCell.swift
//  iFlex
//
//  Created by Mavin Sao on 26/10/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(movie: Movie){
        self.thumbnail.image = UIImage(named: movie.thumbnail)
    }

}
