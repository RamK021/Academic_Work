#include<iostream>
using namespace std;
class abstractStudent{
	virtual void AskForScholarship()=0;
};
class student:abstractStudent{
	private:
		string Name;
		string Branch;
		float CGPA;
	public:
		void info(){
			cout<<"Name  :"<<Name<<endl;
			cout<<"Branch:"<<Branch<<endl;
			cout<<"CGPA  :"<<CGPA<<"\n";
		}
		student(string name, string branch, float cgpa){
			Name = name;
			Branch = branch;
			CGPA = cgpa;
		}	
		void AskForScholarship(){
			if(CGPA > 9){
				cout<<Name<<" got scholarship!!\n";
			}
			else{
				cout<<Name<<", No scholarship for you!!\n";
			}
		}	
};
int main() {
	student s1 = student("Ram", "AI", 9.27);
	s1.info();
	s1.AskForScholarship();
	student s2("Shyam", "ME", 8.99);
	s2.info();
	s2.AskForScholarship();
	return 0;
}


