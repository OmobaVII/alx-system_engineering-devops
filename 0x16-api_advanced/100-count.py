#!/usr/bin/python3
"""
Provides a recursive function that queries the Reddit API
parses the title of all hot articles and prints a sorted
count of given keywords.
"""
from collections import Counter
import requests


def count_words(subreddit, word_list, after=None, count=None):
    """a recursive function"""
    if count is None:
        count = Counter()
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    if after:
        params = {"after": after}
    else:
        params = {}
    headers = requests.utils.default_headers()
    headers.update({'User-Agent': 'My User Agent 1.0'})
    response = requests.get(url, headers=headers, params=params,
                            allow_redirects=False)
    if response.status_code == 200:
        result = response.json()
        hots = result['data']['children']
        words_in_title = []
        for item in hots:
            title = item['data']['title']
            for word in title.lower().split():
                words_in_title.append(word.strip(".,,!?()[]{}\"'"))
            for w in word_list:
                if w.lower() in words_in_title:
                    count[w.lower()] += 1

        after = result['data']['after']
        if after:
            return count_words(subreddit, word_list, after, count)
        else:
            sorted_counts = sorted(count.items(), key=lambda x: (-x[1], x[0]))
            for w, c in sorted_counts:
                print("{}: {}".format(w, c))
            return count
    else:
        return None
