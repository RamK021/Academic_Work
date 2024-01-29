#include<iostream>
using namespace std;
class complex{
	private:
		int a, b;
	public:
		~complex(){ //destructor => it should be defined to release resources allocated to an object
			cout<<"Destructor Called!"<<endl;
		}
};
void fun(){
	complex c;
}
int main() {
	fun();
	return 0;
}

