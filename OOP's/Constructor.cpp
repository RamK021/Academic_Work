#include<iostream>
using namespace std;
class complex{
	private:
		int a, b;
	public:
		complex(int x, int y){ //parameterised constructor
			a = x;
			b = y;
		}
		complex(int k){ //parameterised constructor
			a = k;
		}
		complex(){ //default constructor
			a = 0;
			b = 0;
		}
		complex(complex &c){ //copy constructor
			a = c.a;
			b = c.b;
		}
		void showab(){
			cout<<"(a, b) = ("<<a<<", "<<b<<")"<<endl;
		}
};
int main() {
	complex c1(2,3), c2(5), c3; //complex c1=complex(2,3)
	c1.showab();
	complex c4=c1; // c4(c1) => Niether parameterised & nor default constructor called
	/* Implicitly default or copy constructor is made only, if any constructor except copy constructor
	   is explicitly made than still copy constructor is made by compiler*/
	c4.showab();
	return 0;
}

