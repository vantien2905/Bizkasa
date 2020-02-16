//
//  ShareNativeHelper.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 6/20/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

class ShareNativeHelper: NSObject {
    static let shared = ShareNativeHelper()

    func showShare(controller: UIViewController, code: [Any]) {

        let activityController = UIActivityViewController(activityItems: code, applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = controller.view
        activityController.excludedActivityTypes = [UIActivity.ActivityType.print,
                                                    UIActivity.ActivityType.postToWeibo,
                                                    UIActivity.ActivityType.copyToPasteboard,
                                                    UIActivity.ActivityType.addToReadingList,
                                                    UIActivity.ActivityType.postToVimeo]
        activityController.completionWithItemsHandler = { (nil, completed, _, error) in
            if completed {
                print("completion")
            } else {
                print(error.debugDescription&)
            }
        }
        controller.present(controller: activityController)
    }
}
