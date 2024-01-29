#include<bits/stdc++.h>
using namespace std;
vector<int> selectionSort(vector<int>& v){
	int p;
	for(int i=0; i<v.size(); i++){
		p = i;
		while(p>0 && v[p]<v[p-1]){
			swap(v[p], v[p-1]);
			p--;
		}
	}
	return v;
}
int main() {
	vector<int> v;
	int len, ele;
	cout<<"<.....Insertion Sort.....>"<<endl;
	cout<<"Enter the length of array:";
	cin>>len;
	cout<<"Enter the element of array:"<<endl;
	for(int i=0; i<len; i++){
		cout<<"element "<<i<<":";
		cin>>ele;
		v.push_back(ele);
	}
	cout<<"sorted array:";
	selectionSort(v);
	for(int i=0; i<len; i++)
		cout<<v[i]<<" ";
	return 0;
}

