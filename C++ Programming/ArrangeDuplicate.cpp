#include<bits/stdc++.h>
using namespace std;
int main() {
	
	vector<int> v{2,3,4,5,6,3,2},ds;
	sort(v.begin(),v.end());
	for(int i=0;i<v.size();i++){
		if(count(v.begin(),v.end(),v[i]) > 1){
			ds.insert(ds.begin(),v[i]);
		}
		else{
			ds.push_back(v[i]);
		}
	}
	cout<<"Array:"<<endl;
	for(int i=0;i<ds.size();i++){
		cout<<ds[i]<<" ";
	}
	return 0;
}

