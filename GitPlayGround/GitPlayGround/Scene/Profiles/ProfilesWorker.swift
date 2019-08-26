//
//  ProfilesWorker.swift
//  GitPlayGround
//
//  Created by Tnk. on 26/8/2562 BE.
//  Copyright (c) 2562 Tnk.. All rights reserved.
//

import UIKit

protocol ProfilesStoreProtocol {
  func getData(_ completion: @escaping (Result<Entity>) -> Void)
}

class ProfilesWorker {

  var store: ProfilesStoreProtocol

  init(store: ProfilesStoreProtocol) {
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
