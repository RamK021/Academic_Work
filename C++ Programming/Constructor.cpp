#include<iostream>
using namespace std;
class student{
	string name;
	string branch;
	int age;
	public:
		student(string Name,string Branch,int Age){
			name=Name;
			branch=Branch;
			age=Age;
		}
		void getinfo(){
			static int count=0;
			cout<<"Student "<<++count<<" info:\n";
			cout<<"Name   - "<<name<<endl;
			cout<<"Branch - "<<branch<<endl;
			cout<<"Age    - "<<age<<endl<<endl;
		}
};
int main(){
	student s1=student("Ram","AI",22);
	student s2("Shyam","ME",23);
	s1.getinfo();
	s2.getinfo();
	return 0;
}
