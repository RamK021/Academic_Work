#include<bits/stdc++.h>
using namespace std;
void powerset(vector<int>& v){
	vector<vector<int>> ps;
	vector<int> ds;
	for(int i=0; i<pow(2, v.size()); i++){
		ds.clear();
		for(int j=0; j<v.size(); j++){
			if(i & (1<<j)){
				ds.push_back(v[j]);
			}
		}
		ps.push_back(ds);
	}
	cout<<"Power Set:";
	for(int i=0; i<ps.size(); i++){
		cout<<"{";
		for(int j=0; j<ps[i].size(); j++){
			cout<<ps[i][j]<<" ";
		}
		cout<<"} ";
	}
}
int main() {
	vector<int> v;
	int size, data;
	cout<<"Enter size of Array:";
	cin>>size;
	cout<<"Enter array element:";
	for(int i=0; i<size; i++){
		cin>>data;
		v.push_back(data);
	}
	powerset(v);
	return 0;
}

