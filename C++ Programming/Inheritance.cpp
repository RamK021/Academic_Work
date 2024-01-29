#include<iostream>
using namespace std;
class AbstractStudent{               
	virtual void AskScholarship()=0; 
};
class student:AbstractStudent{ // Base or parent class
	private:                                            
		string branch;
		float cgpa;
	protected:
		string name;           // allow access to project class 
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
		virtual void work(){
			cout<<name<<" is doing bachelor's with "<<branch<<endl;
		}
};
class projectLeader:public student{     //drive or child class
	string projectName;
	public:
		projectLeader(string n,string b,float c,string p):student(n,b,c){
			projectName=p;
		}
		void fixbug(){
			cout<<name<<" is leading "<<projectName<<" project."<<endl;
		}
		void work(){
			cout<<name<<" is working as guider for "<<projectName<<" project."<<endl;
		}
};
class cultureSecretary:public student{
	string eventName;
	public:
		cultureSecretary(string n,string b,float c,string e):student(n,b,c){
			eventName=e;
		}
		void event(){
			cout<<name<<" is managing "<<eventName<<endl;
		}
		void work(){
			cout<<name<<" is working as assisstant for "<<eventName<<endl;
		}
};
int main(){
	projectLeader p1("Ram","AI",9.23,"Machine Learning");
	cultureSecretary c1("Kusal","CSE",7.34,"Hackathon");
	student *s1=&p1;
	student *s2=&c1;
	s1->work();
	s2->work();
	return 0;
}
