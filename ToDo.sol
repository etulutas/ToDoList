// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract TodoList {
   struct Todo {
    string text;
    bool completed;
   }

   Todo[] public todos; 

   function create(string calldata _text)external {
    todos.push(Todo({
        text: _text,
        completed: false
    }));
   }
   function updateText(uint _index, string calldata _text)external {
    todos[_index].text = _text;

    //Accessing the array once save gas more than accessing multiple times array
    Todo storage todo = todos[_index];
    todo.text = _text;
   }

   function get(uint _index) external view returns (string memory, bool){
    Todo memory todo = todos[_index];
    return (todo.text, todo.completed);

   }
   function toggleCompleted(uint _index) external {
    todos[_index].completed = !todos[_index].completed;
   }
}