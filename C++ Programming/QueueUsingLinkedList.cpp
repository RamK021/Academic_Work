#include<iostream>
using namespace std;
// Without using class;
struct node{
	int data;
	node *link = NULL;
};
node *head = NULL;

void enqueue(){
	node *newnode = new node;
	cout<<"Enter data:";
	cin>>newnode->data;
	if(head == NULL){
		head = newnode;
	}
	else{
		node *temp=head;
		while(temp->link!=NULL){
			temp = temp->link;
		}
		temp->link = newnode;
		cout<<newnode->data<<" is inserted!\n";
	}
}
void dequeue(){
	node *temp;
	if(head == NULL){
		cout<<"Queue is empty!\n";
	}
	else{
		temp = head;
		head = temp->link;
		temp->link = NULL;
		cout<<temp->data<<" is deleted!\n";
		delete temp;
	}		
}
void printqueue(){
	if(head == NULL){
		cout<<"Queue is empty!\n";
		return;
	}
	cout<<"Queue:";
	node *temp=head;
	while(temp!=NULL){
		cout<<temp->data<<" ";
		temp = temp->link;
	}
	cout<<endl;
}

int main() {
	int ch;
	while(1){
		cout<<"+------------------+\n";
		cout<<"|QUEUE LINKED LIST |\n";
		cout<<"+------------------+\n";
		cout<<"| [1]Display Queue |\n";
		cout<<"| [2]Enqueue       |\n";
		cout<<"| [3]Dequeue       |\n";
		cout<<"| [4]Exit          |\n";
		cout<<"+------------------+\n";
		cout<<" Enter option:";
		cin>>ch;
		switch(ch){
			case 1:
				printqueue();
				break;
			case 2:
				enqueue();
				break;
			case 3:
				dequeue();
				break;
			case 4:
				cout<<"You are successfully exited!!\n";
				exit(1);
			default:
				cout<<"Wrong option! | Try again!\n";
				break;
		}
	}
	return 0;
}

