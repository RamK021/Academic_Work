#include<bits/stdc++.h>
using namespace std;
vector<int> selectionSort(vector<int>& v){
	for(int i=0; i<v.size(); i++){
		for(int j=0; j<v.size()-i-1; j++){
			if(v[j] > v[j+1]){
				swap(v[j], v[j+1]);
			}
		}
	}
	return v;
}
int main() {
	vector<int> v;
	int len, ele;
	cout<<"<.....Selection Sort.....>"<<endl;
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

