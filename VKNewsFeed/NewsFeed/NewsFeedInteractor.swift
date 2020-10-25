//
//  NewsFeedInteractor.swift
//  VKNewsFeed
//
//  Created by Анастасия Кудашева on 21.09.2020.
//  Copyright (c) 2020 Анастасия Кудашева. All rights reserved.
//

import UIKit

protocol NewsFeedBusinessLogic {
    
    func makeRequest(request: NewsFeed.Model.Request.RequestType)
}

class NewsFeedInteractor: NewsFeedBusinessLogic {
    
    var presenter: NewsFeedPresentationLogic?
    var service: NewsFeedService?
    
    func makeRequest(request: NewsFeed.Model.Request.RequestType) {
        if service == nil {
            service = NewsFeedService()
        }
        switch request {
        case .getNewsFeed:
            service?.getFeed(completion: { [weak self] (revealPostIds, feed) in
                self?.presenter?.presentData(response:  NewsFeed.Model.Response.ResponseType.presentNewsFeed(feed: feed, revealdedPostIds: revealPostIds))
            })
        case .getUser:
            service?.getUser(completion: { [weak self] (user) in
                                self?.presenter?.presentData(response: NewsFeed.Model.Response.ResponseType.presentUserInfo(user: user))
            })
        case .revealPostIds(postid: let postid):
            service?.revealPostIds(forPostId: postid, completion: { [weak self] (revealpostIds, feed) in
                self?.presenter?.presentData(response: NewsFeed.Model.Response.ResponseType.presentNewsFeed(feed: feed, revealdedPostIds: revealpostIds))
            })
        case .getNextBatch:
            self.presenter?.presentData(response: NewsFeed.Model.Response.ResponseType.presentFooterLoader)
            service?.getNextBatch(completion: { [weak self] (revealpostIds, feed) in
                self?.presenter?.presentData(response: NewsFeed.Model.Response.ResponseType.presentNewsFeed(feed: feed, revealdedPostIds: revealpostIds))
            })
        }
    }
}
