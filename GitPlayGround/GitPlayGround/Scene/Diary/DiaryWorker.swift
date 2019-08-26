//
//  DiaryWorker.swift
//  GitPlayGround
//
//  Created by Tnk. on 25/8/2562 BE.
//  Copyright (c) 2562 Tnk.. All rights reserved.
//

import UIKit

protocol DiaryStoreProtocol {
  func getData(_ completion: @escaping (Result<Entity>) -> Void)
}

class DiaryWorker {

  var store: DiaryStoreProtocol

  init(store: DiaryStoreProtocol) {
    self.store = store
  }

  // MARK: - Business Logic

  func doSomeWork(_ completion: @escaping (Result<Entity>) -> Void) {
    // NOTE: Do the work
    store.getData {
      // The worker may perform some small business logic before returning the result to the Interactor
      completion($0)
    }
  }
}
