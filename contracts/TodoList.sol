// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract TodoList {
  uint public taskCount = 0;

  struct Task{
     uint id;
     string content;
     bool completed;
  }
  mapping(uint =>Task)public tasks;

  constructor() public {
    createTask("Create TodoList");
  }

  function createTask(string memory _content) public {
    taskCount++;
    tasks[taskCount] = Task(taskCount, _content, false);
  }

  function deleteTask(uint _id) public {
    require(_id <= taskCount && _id > 0, "Invalid task ID");
    delete tasks[_id];
    taskCount--;
  }
  
}
