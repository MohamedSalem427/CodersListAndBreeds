//
//  CoderItem.swift
//  CodersList
//
//  Created by Mohamed Salem on 21/03/2022.
//

import Foundation

struct CoderItem: Codable {
    let id: Int
    let nodeID: String
    let name: String
    let fullName: String
    let welcomePrivate: Bool
    let owner: Owner
    let htmlURL: String
    let welcomeDescription: String?
    let fork: Bool
    let url: String
    let forksURL: String
    let keysURL: String
    let collaboratorsURL: String
    let teamsURL: String
    let hooksURL: String
    let issueEventsURL: String
    let eventsURL: String
    let assigneesURL: String
    let branchesURL: String
    let tagsURL: String
    let blobsURL: String
    let gitTagsURL: String
    let gitRefsURL: String
    let treesURL: String
    let statusesURL: String
    let languagesURL: String
    let stargazersURL: String
    let contributorsURL: String
    let subscribersURL: String
    let subscriptionURL: String
    let commitsURL: String
    let gitCommitsURL: String
    let commentsURL: String
    let issueCommentURL: String
    let contentsURL: String
    let compareURL: String
    let mergesURL: String
    let archiveURL: String
    let downloadsURL: String
    let issuesURL: String
    let pullsURL: String
    let milestonesURL: String
    let notificationsURL: String
    let labelsURL: String
    let releasesURL: String
    let deploymentsURL: String
    var isSelected: Bool = false
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nodeID = "node_id"
        case name = "name"
        case fullName = "full_name"
        case welcomePrivate = "private"
        case owner = "owner"
        case htmlURL = "html_url"
        case welcomeDescription = "description"
        case fork = "fork"
        case url = "url"
        case forksURL = "forks_url"
        case keysURL = "keys_url"
        case collaboratorsURL = "collaborators_url"
        case teamsURL = "teams_url"
        case hooksURL = "hooks_url"
        case issueEventsURL = "issue_events_url"
        case eventsURL = "events_url"
        case assigneesURL = "assignees_url"
        case branchesURL = "branches_url"
        case tagsURL = "tags_url"
        case blobsURL = "blobs_url"
        case gitTagsURL = "git_tags_url"
        case gitRefsURL = "git_refs_url"
        case treesURL = "trees_url"
        case statusesURL = "statuses_url"
        case languagesURL = "languages_url"
        case stargazersURL = "stargazers_url"
        case contributorsURL = "contributors_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case commitsURL = "commits_url"
        case gitCommitsURL = "git_commits_url"
        case commentsURL = "comments_url"
        case issueCommentURL = "issue_comment_url"
        case contentsURL = "contents_url"
        case compareURL = "compare_url"
        case mergesURL = "merges_url"
        case archiveURL = "archive_url"
        case downloadsURL = "downloads_url"
        case issuesURL = "issues_url"
        case pullsURL = "pulls_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case labelsURL = "labels_url"
        case releasesURL = "releases_url"
        case deploymentsURL = "deployments_url"
    }
}

// MARK: - Owner
struct Owner: Codable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url: String
    let htmlURL: String
    let followersURL: String
    let followingURL: String
    let gistsURL: String
    let starredURL: String
    let subscriptionsURL: String
    let organizationsURL: String
    let reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: TypeEnum
    let siteAdmin: Bool

    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url = "url"
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type = "type"
        case siteAdmin = "site_admin"
    }
}

enum TypeEnum: String, Codable {
    case organization = "Organization"
    case user = "User"
}
