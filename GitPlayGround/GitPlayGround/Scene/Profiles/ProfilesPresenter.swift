//
//  ProfilesPresenter.swift
//  GitPlayGround
//
//  Created by Tnk. on 26/8/2562 BE.
//  Copyright (c) 2562 Tnk.. All rights reserved.
//

import UIKit

protocol ProfilesPresenterInterface {
  func presentSomething(response: Profiles.Something.Response)
}

class ProfilesPresenter: ProfilesPresenterInterface {
  weak var viewController: ProfilesViewControllerInterface!

  // MARK: - Presentation logic

  func presentSomething(response: Profiles.Something.Response) {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller. The resulting view model should be using only primitive types. Eg: the view should not need to involve converting date object into a formatted string. The formatting is done here.

    let viewModel = Profiles.Something.ViewModel()
    viewController.displaySomething(viewModel: viewModel)
  }
}
