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
    private let annotations_c = [
        PathAnnotation(Path(pathType:"C",pathName: "Need for Speed", createrName: "Rex's", discription1: "This path is so smooth that a cyclist will definitely love it! Can't wait to share it with everybody in my Speed Bike Club!" , latitude: 31.282460, longitude: 121.212616)),
        PathAnnotation(Path(pathType:"C",pathName: "Feel the Campus", createrName: "Deborah's", discription1: "I've recorded this path because I am graduating from Tongji, and I want to make some memories while I'm stil here, so here it is." , latitude: 31.285054, longitude: 121.214214))
        
    ]
    private let annotations_s = [
        PathAnnotation(Path(pathType:"S",pathName: "HELL YEAH!", createrName: "Ben's", discription1: "This is one of the most exhilerating path that I've discovered in Jiading campus for skateboarders, I can still hear my hear beatig when I think about it." , latitude: 31.287498, longitude: 121.208555)),
        PathAnnotation(Path(pathType:"S",pathName: "Smoothie", createrName: "Joanna's", discription1: "I named this path 'smoothie' simply because it's so smooth, you'd encounter no rocks, no slides, no pedestrians whatsoever. I'm for sure in love with it." , latitude: 31.288555, longitude: 121.210921))
        
    ]
    private let annotations_r = [
        PathAnnotation(Path(pathType:"R",pathName: "Night Owl", createrName: "Ross's", discription1: "This path is very friendly to users who normally run at night, there are no cars, and the light is very efficient." , latitude: 31.288871, longitude: 121.213530)),
        PathAnnotation(Path(pathType:"R",pathName: "LOVE", createrName: "Rachel's", discription1: "I ran this ''HEART'' shape on the map with Phoebe to show my love to whom I shall never speak of his name." , latitude: 31.289595, longitude: 121.215504))
        
    ]
    
    
    //定位管理器
    var myLocationManager:CLLocationManager = CLLocationManager()
    
     @IBOutlet weak var map2: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.initMyLocationManager()
        map2.delegate = self
        map2.showsUserLocation = true
        map2.userTrackingMode = .followWithHeading
        map2.mapType = .standard
        map2.isScrollEnabled = true
        //地图是否缩放，默认为true
        map2.isZoomEnabled = true
        // 是否旋转
        map2.isRotateEnabled = true
        // 是否显示3D view
        map2.isPitchEnabled = true
        
        if #available(iOS 9.0, *) {
            // 显示指南针
            //map2.showsCompass = true
            // 显示比例
            map2.showsScale = true
            // 显示交通
            map2.showsTraffic = true
        }
        // 显示建筑
        map2.showsBuildings = true
        // 显示兴趣
        map2.showsPointsOfInterest = true
        var latDelta = 0.01
        var longDelta = 0.01
        
        if(home_page==1)
        {
            
            button_end.isHidden=true
            button_end1.isHidden=true
            button_plus.isHidden=false
            button_heart.isHidden=false
            button_return.isHidden=true
            if(rd_type_b==1)
            {map2.addAnnotations(annotations_c)}
            if(rd_type_r==1)
            {map2.addAnnotations(annotations_r)}
            if(rd_type_s==1)
            {map2.addAnnotations(annotations_s)}
            latDelta=0.01
            longDelta=0.01
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
            self.addPolyline()
            latDelta=0.003
            longDelta=0.003
        }
        else
        {
            
            button_end.isHidden=true
            button_end1.isHidden=true
            button_plus.isHidden=true
            button_heart.isHidden=true
            button_return.isHidden=true
        }
        
        
        
        
        
        
        
        
        //创建一个MKCoordinateSpan对象，设置地图的范围（越小越精确）
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
    
    
    
    func accessLocationStatus () {
        // 首次使用 向使用者詢問定位自身位置權限
        if CLLocationManager.authorizationStatus() == .notDetermined {
            // 取得定位服務授權
            myLocationManager.requestWhenInUseAuthorization()
            // 開始定位自身位置
            myLocationManager.startUpdatingLocation()
        }// 使用者已經拒絕定位自身位置權限
        else if CLLocationManager.authorizationStatus() == .denied {
            // 提示可至[設定]中開啟權限
            let alertController = UIAlertController(
                title: "定位權限已關閉",
                message: "如要變更權限，請至 設定 > 隱私權 > 定位服務 開啟",
                preferredStyle: .alert)
            let okAction = UIAlertAction(title: "確認", style: .default, handler:nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }// 使用者已經同意定位自身位置權限
        else if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            // 開始定位自身位置
            myLocationManager.startUpdatingLocation()
        }
    }

//
//    func initMyLocationManager() {
//        // 建立一個 CLLocationManager
//        myLocationManager = CLLocationManager()
//        // 設置委任對象
//        myLocationManager.delegate = self
//        // 距離篩選器 用來設置移動多遠距離才觸發委任方法更新位置
//        myLocationManager.distanceFilter =
//        kCLLocationAccuracyNearestTenMeters
//        // 取得自身定位位置的精確度
//        myLocationManager.desiredAccuracy =
//        kCLLocationAccuracyBest
//    }
//
    
    func addPolyline() {
        //劃線段
        var pointsToUse : [CLLocationCoordinate2D] = []
        for number in 1...40 {
            let lat = 0.0002*Double(number)
            if(number<=23)
            {let location :CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: lat*lat+31.282460, longitude: lat+121.212616)
                pointsToUse.append(location)
            }
            else if(number<35)
            {let location :CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: lat*lat*13+31.282460, longitude: 0.0002*23+121.212616)
                pointsToUse.append(location)}
            else{
                let location :CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: lat*lat*13+lat*lat*5+31.282460, longitude: lat*lat*5+0.0002*23+121.212616)
                pointsToUse.append(location)
            }
            
        }
        
        
        let myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
        map2.add(myPolyline)
    }
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKCircle {
            let circle = MKCircleRenderer(overlay: overlay)
            circle.strokeColor = UIColor.red
            circle.fillColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.1)
            circle.lineWidth = 1
            return circle
        }
        else if overlay is MKPolyline {
            let lineView = MKPolylineRenderer(overlay: overlay)
            lineView.strokeColor = UIColor.blue
            lineView.lineWidth = 2
            return lineView
        }
        else {
            return MKPolylineRenderer()
        }
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












