#include<iostream>
using namespace std;
class Integer{
	private:
		int x;
	public:
		void setData(int a)
		{ x = a; }
		void showData()
		{ cout<<"x="<<x<<endl; }
		Integer operator++(){ // pre-increment 
			Integer i;
			i.x = ++x;
			return i;
		}
		Integer operator++(int){ // post-increment
			Integer i;
			i.x = x++;
			return i;
		}
};
class complex{
	private:
		int a, b;
	public:
		void setData(int x, int y)
		{ a = x; b = y; }
		void showData()
		{ cout<<"a="<<a<<" b="<<b<<endl;}
		/*
		// when an operator is overloaded with multiple jobs => Operator Overloading!.
		// It is a way to implement compile time polymorphism.
		// YOU CAN NOT OVERLOAD "sizeof" AND "?:" OPERATOR.
		complex add(complex c){  
			complex temp;
			temp.a = a + c.a;
			temp.b = b + c.b;
			return temp;
		}
		*/
		complex operator+(complex c){ // Binary operator overloading  
			complex temp;
			temp.a = a + c.a;
			temp.b = b + c.b;
			return temp;
		}
		complex operator-(){ // Uniary operator overloading
			complex temp;
			temp.a = -a;
			temp.b = -b;
			return temp;
		}
};
int main() {
	/*
	complex c1, c2, c3;
	c1.setData(2,3);
	c2.setData(4,5);
	//c3 = c1.add(c2);
	//c3=c1.operator+(c2); => caller object is always in left
	c3=c1+c2; 
	c3.showData();
	//c2=c1.operator-(); => caller object position not always fix, depends on operator behaviour  
	c2 = -c1;
	c2.showData();
	*/
	Integer i1, i2;
	i1.setData(3);
	i2 = ++i1; //i2=i1.operator++();
	i1.showData();
	i2.showData();
	i1.setData(5);
	i2 = i1++;
	i1.showData();
	i2.showData();
	return 0;
}

