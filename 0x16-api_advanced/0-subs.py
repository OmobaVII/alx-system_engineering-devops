#!/usr/bin/python3
"""
Provids a function that queries the
Reddit API and returns the number of
subscribers
"""
import requests


def number_of_subscribers(subreddit):
    """function that gets the number of subscribers"""

    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    response = requests.get(url, headers={'User-Agent': 'My User Agent'})
    if response.status_code == 200:
        result = response.json()
        subscribers = result['data']['subscribers']
        return subscribers
    else:
        return 0
