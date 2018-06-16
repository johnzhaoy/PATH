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
    let pathType: String
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
    let createrName:String?
    let description1:String?
    let path:Path
    
    init(_ path: Path) {
        self.title = path.pathType
        self.subtitle = path.pathName
        self.coordinate = CLLocationCoordinate2D(latitude: path.latitude, longitude: path.longitude)
        self.createrName=path.createrName
        self.description1=path.discription1
        self.path = path
        super.init()
    }
}

