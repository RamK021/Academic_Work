#include<iostream>
using namespace std;
class node {
	public:
	int data;
	node *left;
	node *right;
	node(int data) {
		this->data = data;
		this->left = NULL;
		this->right = NULL;
	}
};
class binaryTree{
	public:
		node *root = NULL;
		void insertNode(int);
		void inorder(node*);
};
void binaryTree::insertNode(int data) {
		node *t=new node(data);
		node *p;
		if(root==NULL) {
			root=t;
		}
		else {
			node *curr = root;
			while(curr) {
				p = curr;
				if(t->data > curr->data) {
					curr = curr->right;
				}
				else {
					curr = curr->left;
				}	
			}
			if(t->data > p->data) {
				p->right = t;
			}
			else {
				p->left = t;
			}
		}
}
void binaryTree::inorder(node* t) {
	if(t->left) {
		inorder(t->left);
	}
	cout<<t->data<<" ";
	if(t->right) {
		inorder(t->right);
	}
}
int main(){
	binaryTree b;
	b.insertNode(50);
	b.insertNode(30);
	b.insertNode(60);
	b.insertNode(20);
	b.insertNode(40);
	
	b.inorder(b.root);
	return 0;
}
