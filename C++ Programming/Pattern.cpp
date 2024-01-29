#include<bits/stdc++.h>
using namespace std;
int main() {
	int s=0, n;
	cout<<"endter n:";
	cin>>n;
	for(int i=0; i<n; i++){
		for(int k=0; k<s; k++) cout<<" ";
		for(int j=0; j<n-i; j++) cout<<"* ";
		cout<<endl;
		s++;
	}
	return 0;
}

