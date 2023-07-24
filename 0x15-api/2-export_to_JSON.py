#!/usr/bin/python3
"""
Uses READ API for a given employee ID,
saves information about todo list to csv file
"""
import json
import requests
from sys import argv


if __name__ == "__main__":
    """prevents from executing when imported"""
    all_users = requests.get("https://jsonplaceholder.typicode.com/users")
    for user in all_users.json():
        if user.get('id') == int(argv[1]):
            Username = (user.get("username"))
            break
    Title = []
    tasks = requests.get("http://jsonplaceholder.typicode.com/todos")
    for task in tasks.json():
        if task.get("userId") == int(argv[1]):
            Title.append((task.get("completed"), task.get("title")))

    task_list = []
    for item in Title:
        task_list.append({"task": item[1], "completed": item[0],
                         "username": Username})

    json_data = {str(argv[1]): task_list}

    json_file = "{}.json".format(argv[1])

    with open(json_file, "w") as myfile:
        json.dump(json_data, myfile)
