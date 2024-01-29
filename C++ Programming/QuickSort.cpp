#include<bits/stdc++.h>
using namespace std;
void quickSort(vector<int>& v, int l, int r){
	if(r-l <= 1){
		return; 
	}
	int yellow = l+1;
	for(int green=yellow; green<r; green++){
		if(v[green]<v[l]){
			swap(v[yellow], v[green]);
			yellow++;
		}
	}
	swap(v[l], v[yellow-1]);
	quickSort(v, l, yellow-1);
	quickSort(v, yellow, r);
}
int main() {
	vector<int> v;
	int len, ele;
	cout<<"<.....Quick Sort.....>"<<endl;
	cout<<"Enter the length of array:";
	cin>>len;
	cout<<"Enter the element of array:"<<endl;
	for(int i=0; i<len; i++){
		cout<<"element "<<i<<":";
		cin>>ele;
		v.push_back(ele);
	}
	cout<<"sorted array:";
	quickSort(v, 0, len);
	for(int i=0; i<len; i++)
		cout<<v[i]<<" ";
	return 0;
}

