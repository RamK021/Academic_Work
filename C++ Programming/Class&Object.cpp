#include<iostream>
using namespace std;
class student{
	public:
	string name;
	string branch;
	int age;
	void getinfo(){
		static int count=0;
		cout<<"Student "<<++count<<" Info:\n";
		cout<<"Name   - "<<name<<endl;
		cout<<"Branch - "<<branch<<endl;
		cout<<"Age    - "<<age<<endl<<endl;
	}
};
int main(){
	student s1;
	s1.name="Ram";
	s1.branch="AI";
	s1.age=22;
	s1.getinfo();
	
	student s2;
	s2.age=23;
	s2.branch="ME";
	s2.name="Shyam";
	s2.getinfo();
	return 0;
}
