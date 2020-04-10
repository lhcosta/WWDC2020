//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Provides supporting functions for setting up a live view.
//

import UIKit
import PlaygroundSupport

/// Instantiates a new instance of a live view.
///
/// By default, this loads an instance of `LiveViewController` from `LiveView.storyboard`.
public func instantiateLiveView() -> PlaygroundLiveViewable {
    
    let viewController = SelectViewBuilder.build(frame:  CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 1024, height: 768))) as! SelectActivityViewController

    let activityCoordinator = ActivityCoordinator(rootViewController: viewController)
    viewController.preferredContentSize = viewController.view.frame.size

    return activityCoordinator.navigationController
}

