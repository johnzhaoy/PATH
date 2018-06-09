//
//  ViewController.swift
//  path
//
//  Created by 零星 on 2018/4/20.
//  Copyright © 2018年 zbq. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController{
    
    @IBOutlet weak var button_heart: UIButton!
    @IBOutlet weak var button_plus: UIButton!
    @IBOutlet weak var button_end1: UIButton!
    @IBOutlet weak var button_end: UIButton!
    @IBOutlet weak var button_return: UIButton!
    
    var home_page=1
    var recode_page=0
    var trace_page=0
    var rd_type_b=1
    var rd_type_s=1
    var rd_type_r=1

    private let annotations_b = [
        PathAnnotation(Path(pathName: "B", createrName: "yu", discription1: "balabala" , latitude: 31.282460, longitude: 121.212616)),
        PathAnnotation(Path(pathName: "B", createrName: "john", discription1: "labalabalab" , latitude: 31.285054, longitude: 121.214214))
        
    ]
    private let annotations_s = [
        PathAnnotation(Path(pathName: "S", createrName: "yu", discription1: "balabala" , latitude: 31.287498, longitude: 121.208555)),
        PathAnnotation(Path(pathName: "S", createrName: "john", discription1: "labalabalab" , latitude: 31.288555, longitude: 121.210921))
        
    ]
    private let annotations_r = [
        PathAnnotation(Path(pathName: "R", createrName: "yu", discription1: "balabala" , latitude: 31.288871, longitude: 121.213530)),
        PathAnnotation(Path(pathName: "R", createrName: "john", discription1: "labalabalab" , latitude: 31.289595, longitude: 121.215504))
        
    ]
   
    
    var mainMapView: MKMapView!
    //定位管理器
    let locationManager:CLLocationManager = CLLocationManager()
     @IBOutlet weak var map2: MKMapView!
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        map2.delegate = self
        
        
        
        print("home_page=",home_page)
        print("recore_page",recode_page)
        print("trace_page",trace_page)
        
      
        
        if(home_page==1)
        {
           
            button_end.isHidden=true
            button_end1.isHidden=true
            button_plus.isHidden=false
            button_heart.isHidden=false
            button_return.isHidden=true
            if(rd_type_b==1)
            {map2.addAnnotations(annotations_b)}
            if(rd_type_r==1)
            {map2.addAnnotations(annotations_r)}
            if(rd_type_s==1)
            {map2.addAnnotations(annotations_s)}
        }
        else if(recode_page==1)
        {
            
            button_end.isHidden=false
            button_end1.isHidden=true
            button_plus.isHidden=true
            button_heart.isHidden=true
            button_return.isHidden=true
        }
        else if(trace_page==1)
        {
           
            button_end.isHidden=true
            button_end1.isHidden=false
            button_plus.isHidden=true
            button_heart.isHidden=true
            button_return.isHidden=false
        }
        else
        {
            
            button_end.isHidden=true
            button_end1.isHidden=true
            button_plus.isHidden=true
            button_heart.isHidden=true
            button_return.isHidden=true
        }
        //使用代码创建
        //        self.mainMapView = MKMapView(frame:self.view.frame)
        //       self.view.addSubview(self.mainMapView)
        
        //地图类型设置 - 标准地图
        map2.mapType = MKMapType.standard
        
        //创建一个MKCoordinateSpan对象，设置地图的范围（越小越精确）
        let latDelta = 0.01
        let longDelta = 0.01
        let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        //定义地图区域和中心坐标（
        //使用当前位置
        //var center:CLLocation = locationManager.location.coordinate
        //使用自定义位置
        let center:CLLocation = CLLocation(latitude: 31.282460, longitude: 121.212616)
        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate,
                                                                  span: currentLocationSpan)
        
        //设置显示区域
        map2.setRegion(currentRegion, animated: true)
//
//        //创建一个大头针对象
//        let objectAnnotation = MKPointAnnotation()
//        //设置大头针的显示位置
//        objectAnnotation.coordinate = CLLocation(latitude: 32.029171,
//                                                 longitude: 118.788231).coordinate
//        //设置点击大头针之后显示的标题
//        objectAnnotation.title = "南京夫子庙"
//        //设置点击大头针之后显示的描述
//        objectAnnotation.subtitle = "南京市秦淮区秦淮河北岸中华路"
//        //添加大头针
//        map2.addAnnotation(objectAnnotation)
//
    }

}


extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier, for: annotation)
        guard let markerAnnotationView = annotationView as? MKMarkerAnnotationView,
            let pathAnnotation = annotation as? PathAnnotation else { return annotationView }
        configureMarkerAnnotationView(markerAnnotationView: markerAnnotationView, pathAnnotation: pathAnnotation)
        return markerAnnotationView
    }
    
    /// MKMarkerAnnotationViewの細かい設定をする
    private func configureMarkerAnnotationView(markerAnnotationView: MKMarkerAnnotationView, pathAnnotation: PathAnnotation) {
        markerAnnotationView.clusteringIdentifier = PathAnnotation.clusteringIdentifier
        markerAnnotationView.canShowCallout = true
        markerAnnotationView.glyphText = pathAnnotation.title
        markerAnnotationView.calloutOffset = CGPoint(x: -5, y: 5)
        markerAnnotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        markerAnnotationView.annotation = pathAnnotation
        let detailLabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.font = detailLabel.font.withSize(12)
        detailLabel.text = pathAnnotation.subtitle
        markerAnnotationView.detailCalloutAccessoryView = detailLabel
    }
    
    /// 店舗詳細を表示する際には、shopを渡すためにannotationを渡してあげる。
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
    calloutAccessoryControlTapped control: UIControl) {
        guard let pathAnnotaion = view.annotation as? PathAnnotation else { return }
        performSegue(withIdentifier: "backback", sender: pathAnnotaion)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let Annotation = sender as? PathAnnotation
        if segue.identifier == "backback"
        {
            let detailVC = segue.destination as! back_to_map
            detailVC.path=Annotation?.path
        }
        
        
    }
    
    
}











