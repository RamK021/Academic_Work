#include<bits/stdc++.h>
using namespace std;
class Node{
	public:
		int data;
		Node *link;
		Node(int data){
			this->data = data;
			this->link = NULL;
		}
};
class Stack{
	Node *top;
	public:
		Stack(){
			top = NULL;
		}
		void push(int data);
		void pop();
		void traverse();
};
void Stack::push(int data){
	Node *temp = new Node(data);
	temp->link = top;
	top = temp;
	cout<<temp->data<<" is pushed!"<<endl;
}
void Stack::pop(){
	Node *temp;
	if(top==NULL){
		cout<<"Stack is empty!"<<endl;
	}
	else{
		temp = top;
		cout<<temp->data<<" is poped!"<<endl;
		top = temp->link;
		temp->link = NULL;
		delete(temp);
	}
}
void Stack::traverse(){
	Node *temp;
	if(top == NULL){
		cout<<"Stack is empty!"<<endl;
	}
	else{
		cout<<"Stack element are:"<<endl;
		temp = top;
		while(temp!=NULL){
			cout<<temp->data<<endl;
			temp = temp->link;
		}
	}
}
int main() {
	Stack stack;
	stack.push(10);
	stack.push(20);
	stack.push(30);
	stack.push(40);
	stack.traverse();
	stack.pop();
	stack.traverse();
	return 0;
}

