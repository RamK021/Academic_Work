#include<iostream>
using namespace std;
class node{
	public:
		int data;
		node* link;
		
		node(){
			data = 0;
			link = NULL;	
		}
		node(int data){
			this->data = data;
			this->link = NULL;
		}
};
class linklist{
	node* head;
	public:
		linklist(){
			head=NULL;
		}
		void printlist();
		void insertnode(int);
		int length();
		void reverselist(linklist);
		void deletenode(linklist);
		void addafter(linklist);
};
void linklist::insertnode(int data){
	node* newnode = new node(data);
	if(head == NULL){
		head = newnode;
		cout<<data<<" is inserted!\n";
	}
	else{
		node* temp = head;
		while(temp->link!=NULL){
			temp = temp->link;
		}
		temp->link = newnode;
		cout<<data<<" is inserted!\n";
	}
}
void linklist::printlist(){
	if(head==NULL){
		cout<<"List is empty!\n";
		return;
	}
	cout<<"Link List: ";
	node* temp = head;
	while(temp != NULL){
		cout<<temp->data<<" ";
		temp = temp->link;
	}
	cout<<endl;
}
int linklist::length(){
	if(head==NULL){
		return 0;
	}
	else{
		int count = 0;
		node* temp = head;
		while(temp!=NULL){
			count++;
			temp = temp->link;
		}
		return count;
	}
}
void linklist::reverselist(linklist list){
	int i=0, j=list.length()-1, k, temp;
	node *p, *q;
	p=q=head;
	while(i<j){
		k=0;
		while(k<j){
			q=q->link;
			k++;
		}
		temp = p->data;
		p->data = q->data;
		q->data = temp;
		i++;
		j--;
		p=p->link;
		q=head;
	}
	cout<<"Reverse ";
	list.printlist();
}
/*
void LinkedList::reverseList(){
	Node *temp = NULL, *nextNode = NULL;
	if(head == NULL){
		cout<<"List is empty!!"<<endl;
	}
	else{
		while(head){
			nextNode = head->link;
			head->link = temp;
			temp = head;
			head = nextNode;
		}
		head = temp;
	}
}
*/

void linklist::deletenode(linklist list){
	node* temp;
	int loc;
	cout<<"Enter node loc to delete:";
	cin>>loc;
	if(loc > list.length()){
		cout<<"Invalid Location!!\n";		
	}
	else if(loc == 1){
		temp = head;
		head = temp->link;
		temp->link = NULL;
		delete temp;
		cout<<"Node "<<loc<<" deleted!\n";
	}
	else{
		node *p = head, *q;
		int i=1;
		while(i<loc-1){
			p=p->link;
			i++;
		}
		q=p->link;
		p->link = q->link;
		q->link = NULL;
		delete q;
		cout<<"Node "<<loc<<" deleted!\n";
	}
}
void linklist::addafter(linklist list){
	int loc, i=1;
	node *newnode, *p;
	cout<<"Enter Location:";
	cin>>loc;
	if(loc > list.length()){
		cout<<"Invalid Location!\n";
		cout<<"Currently list having "<<list.length()<<" nodes!\n";
	}
	else if(loc == 1){
		node *newnode = new node();
		cout<<"Enter node data:";
		cin>>newnode->data;
		newnode->link = head;
		head = newnode;
	}
	else{
		p = head;
		while(i < loc-1){
			p = p->link;
			i++;
		}
		newnode = new node();
		cout<<"Enter node data:";
		cin>>newnode->data;
		newnode->link = p->link; //right connection
		p->link = newnode;       //left connection
		cout<<newnode->data<<" is inserted!\n";
	}
}

int main() {
	int ch;
	linklist l;
	while(1){
		cout<<"+------------------------+\n";
		cout<<"|      LINKED LIST       |\n";
		cout<<"+------------------------+\n";
		cout<<"| [1]Display List        |\n";
		cout<<"| [2]Append Node         |\n";
		cout<<"| [3]Display Length      |\n";
		cout<<"| [4]Reverse List        |\n";
		cout<<"| [5]Delete Node         |\n";
		cout<<"| [6]Add Node by Location|\n";
		cout<<"| [7]Exit                |\n";
		cout<<"+------------------------+\n";
		cout<<" Enter option:";
		cin>>ch;
		switch(ch){
			case 1:
				l.printlist();
				break;
			case 2:
				int data;
				cout<<"Enter node data:";
				cin>>data;
			    l.insertnode(data);
			    break;
			case 3:
				int len;
				len = l.length();
				cout<<"length of list: "<<len<<endl;
				break;
			case 4:
				l.reverselist(l);
				break;
			case 5:
				l.deletenode(l);
				break;
			case 6:
				l.addafter(l);
				break;
			case 7:
				cout<<"Your are successfully exited!!\n";
				exit(1);
			default:
				cout<<"Wrong option! | Try Again!"<<endl;
		}		
	}
	return 0;
}

