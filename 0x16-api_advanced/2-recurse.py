#!/usr/bin/python3
"""
Provides a recursive function that queries the Reddit API
and returns a list containing the tittles of all host articles
for a given subreddit.
"""
import requests


def recurse(subreddit, hot_list=[], after=None):
    """a recursive function that returns a list containt the titles
    of all hot articles"""
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    if after:
        url = url + "?after=" + after
    response = requests.get(url, headers={'User-Agent': 'My User Agent'})
    result = response.json()
    hots = result['data']['children']
    if not hots:
        return hot_list
    for items in hots:
        hot_list.append(items['data']['title'])
    after = result['data']['after']
    if not after:
        return hot_list
    else:
        return (recurse(subreddit, hot_list, after))
