//
//  DiaryPresenter.swift
//  GitPlayGround
//
//  Created by Tnk. on 25/8/2562 BE.
//  Copyright (c) 2562 Tnk.. All rights reserved.
//

import UIKit

protocol DiaryPresenterInterface {
  func presentSomething(response: Diary.Something.Response)
}

class DiaryPresenter: DiaryPresenterInterface {
  weak var viewController: DiaryViewControllerInterface!

  // MARK: - Presentation logic

  func presentSomething(response: Diary.Something.Response) {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller. The resulting view model should be using only primitive types. Eg: the view should not need to involve converting date object into a formatted string. The formatting is done here.

    let viewModel = Diary.Something.ViewModel()
    viewController.displaySomething(viewModel: viewModel)
  }
}
