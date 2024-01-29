 #include<iostream>
 using namespace std;
 class player
 {
 	private : 
	 int a,b,c;
 	public :
	  int d,e;
 	void setdata(int a1,int b1,int c1);
 	void getdata()
 	{
 		cout<<"the value of a is"<<a<<endl;		
 		cout<<"the value of b is"<<b<<endl;
 		cout<<"the value of c is"<<c<<endl;
 		cout<<"the value of d is"<<d<<endl;
 		cout<<"the value of e is"<<e<<endl;
	}
 };
 void player :: setdata(int a1,int b1,int c1)
 {
 
	a = a1;
	b = b1;
	c = c1;
}
 int main()
 {
 	player manav;
 	//manav.a=50;
 	manav.d=67;
 	manav.e=19;
 	manav.setdata(1,2,3);
 	manav.getdata();
 	return 0;
 	
  } 
