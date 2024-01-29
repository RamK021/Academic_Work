#include<bits/stdc++.h>
using namespace std;
// Operator overloading as a friend function.
class Complex{
	int a, b;
	public:
		void setData(int x, int y){
			a = x;
			b = y;
		}
		void showData(){
			cout<<"a="<<a<<" b="<<b<<endl;
		}
		friend Complex operator+(Complex, Complex);
};
Complex operator+(Complex o1, Complex o2){
	Complex temp;
	temp.a = o1.a + o2.a;
	temp.b = o1.b + o2.b;
	return temp;
}
// Friend function can become friend to more than one class
class B;
class A{
	int a;
	public:
		void seta(int a){
			this->a = a;
		}
		friend void fun(A, B);
};
class B{
	int b;
	public:
		void setb(int b){
			this->b = b;
		}
		friend void fun(A, B);
};
void fun(A o1, B o2){
	cout<<"sum="<<o1.a+o2.b<<endl;
}
class Add{
	private:
		int a, b;
	public:
		void setData(int x, int y){
			a = x;
			b = y;
		}
		void showData(){
			cout<<"a="<<a<<" b="<<b<<endl;
		}
		friend void fun(Add);
};
void fun(Add obj){
	cout<<"sum="<<obj.a+obj.b<<endl;
}
int main() {
	/*
	Add a1;
	a1.setData(2,3);
	a1.showData();
	fun(a1); //friend functoin calling;
	*/
	/*
	A a1;
	B b1;
	a1.seta(2);
	b1.setb(3);
	fun(a1, b1);
	*/
	Complex c1, c2, c3;
	c1.setData(2,3);
	c2.setData(3,4);
	//c3=operator+(c1, c2); 
	c3=c1+c2;
	c3.showData();
	return 0;
}

