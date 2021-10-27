//
//  ViewController.swift
//  iFlex
//
//  Created by Mavin Sao on 21/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bigThumbnailView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "CollectionMovie", bundle: nil), forCellReuseIdentifier: "movieAlbumCell")
        customNavigation()
        prepareUI()
    
    }
    func prepareUI(){
        let view = UIView(frame: self.imageView.frame)
        let gradient = CAGradientLayer()
        var frame =  view.bounds
        frame.size.height += view.frame.height / 2
        frame.size.width = view.frame.width * 2
        gradient.frame = frame
        gradient.colors = [UIColor.black.cgColor,UIColor.clear.cgColor, UIColor.black.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
        imageView.addSubview(view)
    }
    
    func customNavigation(){
        // Make the navigation bar background clear

        let gradientLayer = CAGradientLayer()
        var frame = navigationController!.navigationBar.bounds
        frame.size.height += UIApplication.shared.statusBarFrame.height
        gradientLayer.frame = frame
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        setUpLogo()
    }
    
    func setUpLogo(){
        let logo = UIImage(named: "netflix")
        let logoImageView = UIImageView(image: logo)
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 40),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
        ])
        let imageItem = UIBarButtonItem(customView: logoImageView)
        self.navigationItem.leftBarButtonItem = imageItem
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let movieAlbum = movies[indexPath.row] as! [String:Any]
        
        if (movieAlbum["groupe"] as! String) == "Trending Now" {
            return 300
        }
        return 250
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieAlbumCell", for: indexPath) as! CollectionMovie
        cell.selectionStyle = .none
        cell.config(data: movies[indexPath.row])
        return cell
    }
    
    
}
