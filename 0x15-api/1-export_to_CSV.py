#!/usr/bin/python3
"""
Uses READ API for a given employee ID,
saves information about todo list to csv file
"""
import requests
from sys import argv
import csv


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

    myfile = "{}.csv".format(argv[1])
    with open(myfile, "w") as f:
        fields = ["USER_ID", "USERNAME", "TASK_COMPLETED_STATUS", "TASK_TITLE"]
        write = csv.DictWriter(f, fieldnames=fields, quoting=csv.QUOTE_ALL)
        for task in Title:
            write.writerow({"USER_ID": argv[1], "USERNAME": Username,
                            "TASK_COMPLETED_STATUS": task[0],
                            "TASK_TITLE": task[1]})
