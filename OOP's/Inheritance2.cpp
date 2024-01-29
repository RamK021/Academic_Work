#include<iostream>
using namespace std;
class Dummy{
	private:
		int a, b;
		int *p;
	public:
		Dummy(){
			p = new int;
		}
		void setData(int x, int y, int z){
			a = x;
			b = y;
			*p = z;
		}
		void showData(){
			cout<<"a="<<a<<" b="<<b<<" p="<<*p<<endl;
		}
		Dummy(Dummy &d){ // If it is shallow copy than it point to invalid location..
			a = d.a;
			b = d.b;
			p = new int;
			*p = *(d.p);
		}
		~Dummy(){
			delete p;
		}
};
int main() {
	Dummy d1, d2;
	d1.setData(1,2,5);
	d2 = d1; // Deep copy
	d2.showData();
	return 0;
}

