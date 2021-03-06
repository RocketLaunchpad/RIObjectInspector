//
//  AppDelegate.swift
//  ObjectInspectorExample
//
//  Copyright (c) 2020 Rocket Insights, Inc.
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//

import CoreLocation
import ObjectInspector
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ObjectInspectorViewController.inspecting(array: sampleData, delegate: self)
        window?.makeKeyAndVisible()
        return true
    }
}

extension AppDelegate: ObjectInspectorViewControllerDelegate {

    func objectInspector(_ sender: ObjectInspectorViewController, customViewControllerForObject object: Any) -> UIViewController? {
        guard let coord = object as? CLLocationCoordinate2D else {
            return nil
        }

        let vc = MapViewController(location: coord)
        vc.title = "Location"
        return vc
    }

    func objectInspector(_ sender: ObjectInspectorViewController, customDescriptionForObject object: Any) -> String? {
        guard let place = object as? Place else {
            return nil
        }

        return "Place: \(place.name)"
    }
}
