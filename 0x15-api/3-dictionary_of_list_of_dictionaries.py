#!/usr/bin/python3
"""
Uses READ API for all employees,
saves information about todo list to json file
"""
import json
import requests


if __name__ == "__main__":
    """prevents from executing when imported"""
    all_users = requests.get("https://jsonplaceholder.typicode.com/users")
    users = []
    for user in all_users.json():
        users.append((user.get('id'), user.get("username")))
    Title = []
    tasks = requests.get("http://jsonplaceholder.typicode.com/todos")
    for task in tasks.json():
        Title.append((task.get("userId"), task.get("completed"),
                     task.get("title")))

    task_dict = {}
    for employee in users:
        task_list = []
        for item in Title:
            if item[0] == employee[0]:
                task_list.append({"task": item[2], "completed": item[1],
                                 "username": employee[1]})
        task_dict[str(employee[0])] = task_list

    json_file = "todo_all_employees.json"
    with open(json_file, "w") as myfile:
        json.dump(task_dict, myfile, sort_keys=True)
