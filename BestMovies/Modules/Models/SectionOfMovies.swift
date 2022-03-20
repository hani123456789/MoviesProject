//
//  SectionOfMovies.swift
//  BestMovies
//
//  Created by HaniMac on 19/03/2022.
//
import RxDataSources

struct SectionOfMovies {
  var items: [Item]
}

extension SectionOfMovies: SectionModelType {
  typealias Item = Movie

   init(original: SectionOfMovies, items: [Item]) {
    self = original
    self.items = items
  }
}


