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
        url = url + '?after=' + after
    headers = requests.utils.default_headers()
    headers.update({'User-Agent': 'My User Agent 1.0'})
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 200:
        result = response.json()
        hots = result['data']['children']
        for item in hots:
            hot_list.append(item['data']['title'])
        after = result['data']['after']
        if after:
            return recurse(subreddit, hot_list, after)
        else:
            if len(hot_list) == 0:
                return None
            else:
                return hot_list
    else:
        return None
