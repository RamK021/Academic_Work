#include<iostream>
using namespace std;
class AbstractStudent{                //Abstract class 
	virtual void AskScholarship()=0; //pure virtual function
};
class student:AbstractStudent{
	private:                          // making data member & member function
		string name;                  // private is known as encapsulation.
		string branch;
		float cgpa;
	public:
		student(string n,string b,float c){
			name=n;
			branch=b;
			cgpa=c;
		}
		void getinfo(){
			cout<<"Name   - "<<name<<endl;
			cout<<"Branch - "<<branch<<endl;
			cout<<"CGPA   - "<<cgpa<<endl;
		}
		void AskScholarship(){
			if(cgpa >= 9){
				cout<<name<<" got scholarship!!"<<endl;
			}
			else{
				cout<<name<<", Sorry! NO scholarship for you."<<endl;
			}
		}
};
int main(){
	student s1("Ram","AI",9.23);
	student s2("Shyam","ME",8.99);
	s1.getinfo();
	s1.AskScholarship();
	s2.getinfo();
	s2.AskScholarship();
	student s3("Manav","BCA",10);
	s3.getinfo();
	s3.AskScholarship();
}
