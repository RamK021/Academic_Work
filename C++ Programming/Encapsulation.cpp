#include<iostream>
using namespace std;
/* The idea of encapsulation is to make data member private and 
   to do interact with we use getter & setters. */

class student{
	private:
		string Name;
		string Branch;
		float CGPA;
	public:
		void setName(string name){
			Name = name;
		}
		string getName(){
			return Name;
		}
		void setBranch(string branch){
			Branch = branch;
		}
		string getBranch(){
			return Branch;
		}
		void setCGPA(float cgpa){
			CGPA = cgpa;
		}
		float getCGPA(){
			return CGPA;
		}
		void info(){
			cout<<"Name  :"<<Name<<endl;
			cout<<"Branch:"<<Branch<<endl;
			cout<<"CGPA  :"<<CGPA<<"\n\n";
		}
		student(string name, string branch, float cgpa){
			Name = name;
			Branch = branch;
			CGPA = cgpa;
		}		
};
int main() {
	student s1 = student("Ram Kumar", "AI", 9.27);
	s1.info();
	s1.setName("Shyam Kumar");
	s1.setBranch("ME");
	s1.setCGPA(8.99);
	s1.info();
	return 0;
}

