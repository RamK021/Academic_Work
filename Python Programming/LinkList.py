class Node:
    def __init__(self, data = None):
        self.data = data
        self.next = None

class LinkedList:
    def __init__(self):
        self.head = None

    def append(self, v):
        newnode = Node(v)
        if self.head == None:
            self.head = newnode
        else:
            temp = self.head
            while temp.next:
                temp = temp.next
            temp.next = newnode
        print(v, " is appended!")

    def reverseList(self):
        root = self.head
        new = None
        temp = None
        while root:
            new = root.next
            root.next = temp
            temp = root
            root = new
        self.head = temp

    def display(self):
        print("Linked List:", end="")
        temp = self.head
        while temp:
            print(temp.data, end=" ")
            temp = temp.next
        print()

l = LinkedList()
l.append(4)
l.append(5)
l.append(6)
l.append(7)
l.display()
l.reverseList()
l.display()





    
