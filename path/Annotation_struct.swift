//
//  Annotation_struct.swift
//  path
//
//  Created by 赵云 on 2018/6/5.
//  Copyright © 2018年 zbq. All rights reserved.
//

import Foundation
import MapKit
struct Path {
    let pathName: String
    let createrName: String
    let discription1:String
    let latitude: Double
    let longitude: Double
}


class PathAnnotation: NSObject, MKAnnotation {
    static let clusteringIdentifier = "Path"
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    let path:Path
    
    init(_ path: Path) {
        self.title = path.pathName
        self.subtitle = path.createrName
        self.coordinate = CLLocationCoordinate2D(latitude: path.latitude, longitude: path.longitude)
        self.path = path
        super.init()
    }
}