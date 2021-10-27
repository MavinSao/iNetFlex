//
//  Movies.swift
//  iFlex
//
//  Created by Mavin on 27/10/21.
//

import Foundation

struct Movie {
    let title    : String
    let thumbnail: String
}

var movies: [[String:Any]] = [
    [
        "groupe": "Asian TV Shows",
        "movies": [
            Movie(title: "MyName", thumbnail: "myname"),
            Movie(title: "Cha Cha", thumbnail: "chacha"),
            Movie(title: "I see Dead people", thumbnail: "deadpeople"),
            Movie(title: "The King Affection", thumbnail: "kingaffect"),
            Movie(title: "The K2", thumbnail: "k2"),
            Movie(title: "Vincenzo", thumbnail: "vincenzo"),
        ]
    ],
    [
        "groupe": "Trending Now",
        "movies": [
            Movie(title: "Baki", thumbnail: "baki"),
            Movie(title: "MyName", thumbnail: "myname"),
            Movie(title: "The K2", thumbnail: "k2"),
            Movie(title: "The King Affection", thumbnail: "kingaffect"),
            Movie(title: "Vincenzo", thumbnail: "vincenzo"),
        ]
    ],
    [
        "groupe": "Only on Netflix",
        "movies": [
            Movie(title: "Vincenzo", thumbnail: "vincenzo"),
            Movie(title: "The K2", thumbnail: "k2"),
            Movie(title: "Baki", thumbnail: "baki"),
            Movie(title: "The King Affection", thumbnail: "kingaffect"),
         
        ]
    ]
]
