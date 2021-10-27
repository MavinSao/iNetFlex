//
//  CollectionMovie.swift
//  iFlex
//
//  Created by Mavin Sao on 26/10/21.
//

import UIKit

class CollectionMovie: UITableViewCell {

    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var album: [String:Any] = [:]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate   = self
        collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "movieCell")
    }
    
    func config(data: [String:Any]){
        self.album = data
        self.albumTitle.text = data["groupe"] as? String
    }
    
}

extension CollectionMovie: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        (album["movies"] as! [Movie]).count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.collectionView.bounds.width
        let heigh = self.collectionView.bounds.height
        
        if (album["groupe"] as! String) == "Trending Now"{
            let wCell = (width/3) + 20
            let hCell = (heigh) + 100
            return CGSize(width: wCell, height: hCell)
        }
        return CGSize(width: 115, height: 175)

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        
        let allmovie = album["movies"] as! [Movie]
        
        cell.config(movie: allmovie[indexPath.row])
        return cell
    }
    
    
}
