#!/usr/bin/python3
"""
Provides a function that queries the Reddit API
and prints the tittles of the first 10 hot posts
listed for a given subreddit
"""
import requests


def top_ten(subreddit):
    """a function that prints the first 10 hot posts"""

    url = "https://www.reddit.com/r/{}.json?limit=10".format(subreddit)
    response = requests.get(url, headers={'User-Agent': 'My User Agent'})
    if response.status_code == 200:
        result = response.json()
        top = result['data']['children']
        for items in top:
            print(items['data']['title'])
    else:
        print(None)
