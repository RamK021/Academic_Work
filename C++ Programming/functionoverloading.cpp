#include<iostream>
using namespace std;
int sum(int a,int b)
{
	cout<<"using function with 2 arguments"<<endl;
	return a+b;
}
int sum(int a,int b,int c)
{
	cout<<"using function with 3 arguments"<<endl;
	return a+b+c;
}
int volume(int r,int h)
{
	return(3.14*r*r*h);
}

int volume(int a)
{
	return(a*a*a);	
}

int volume(int l,int b,int h)
{
	return(l*b*h);
}
int main()
{
	cout<<"the sum of 3 and 6 is"<<sum(3,6)<<endl;
	cout<<"the sum of 3,7 and 6 is"<<sum(3,7,6)<<endl;
	cout<<"the volume of cylinder is"<<volume(4,5)<<endl;
	cout<<"the volume of cube is"<<volume(5)<<endl;
	cout<<"the volume of cuboied is"<<volume(3,7,3)<<endl;	
	return 0;
}
