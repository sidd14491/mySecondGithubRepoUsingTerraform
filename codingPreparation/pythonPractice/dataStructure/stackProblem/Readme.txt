Stack in Python
    A stack is a linear data structure that follows the principle of 
    Last in Fast Out(LIFO). This means the last element inserted inside the
    the stack is removed first

Basic Operations of Stacks:
    There are some basic operations that allow us to perform different actions on a stack.
        a) Push: Add an element to the top of a stack
        b) Pop: Remove an element from the top of a stack
        c) IsEmpty: Check if the stack is Empty
        d) IsFull: Check if the stack is IsFull
        e) Peek: Get the value of the top element without removing it.

Working of Stack Data Structure.
    The operations work as follows:
        a) A pointer called "TOP" is used to keep track of top element in the stack.
        b) When initializing the stack, we set it's value -1 so that we can check if the
            stack is empty by comapring "TOP == -1"
        c) On pushing an element, we increase the value of "TOP" and place the new element
            in the position pointed to by "TOP"
        d) Op popping an element,we return the element pointed to by "TOP" and reduce its
            value
        e) Before pushing,we check if the stack is already IsFull
        f) Before popping,we check if the stack is already empty.
