#include<iostream>
using namespace std;
/*
Types of Inheritance:
1.Single Inheritance
	class A{
		...
	};
	class B:public A{
		...
	};
2.Multilevel Inheritance
	class A{
		...
	};
	class B:public A{
		...
	};
	class C:public B{
		...
	};
3.Multiple Inheritance
	class A{
		...
	};
	class B{
		...
	};
	class C:public A, public B{
		...
	};
4.Hierarchical Inheritance
	class A{
		...
	};
	class B:public A{
		...
	};
	class C:public A{
		...
	};
5.Hybrid Inheritance
*/
class A{
	private:
		int a;
	protected:
		void setValue(int value){
			a = value;
		}
};
class B:public A{
	public:
		void setData(int data){
			setValue(data);
		}
};
int main() {
	B b;
	b.setValue(5); //b.setData(5); => Not accessible bz protected in class B.
	return 0;
}

