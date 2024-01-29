#include<iostream>
using namespace std;
class A{
	public:
		void f1(){
			
		}
		void f2(){
			
		}
};
class B:public A{
	void f1(){ // Method Overriding
		
	}
	void f2(int x){ // Method Hiding
		
	}
};
int main() {
	B b;
	b.f1(); // Early binding: check object type;
	b.f2(); // Error: f2() proto-type not matched, if f2() not exist in class B then it check in class A
	b.f2(2); 
	return 0;
}

