#include<bits/stdc++.h>
using namespace std;
vector<int> merge(vector<int>& A, vector<int>& B){
	vector<int> C;
	int i=0, j=0, m=A.size(), n=B.size();
	while(i+j < m+n){
		if(i==m){
			C.push_back(B[j]);
			j++;
		}
		else if(j==n){
			C.push_back(A[i]);
			i++;
		}
		else if(A[i]<=B[j]){
			C.push_back(A[i]);
			i++;
		}
		else if(A[i]>=B[j]){
			C.push_back(B[j]);
			j++;
		}
	}
	return C;
}
vector<int> mergeSort(vector<int>& v, int left, int right){
	if(right-left <= 1){
		return vector<int>(v.begin()+left, v.begin()+right);
	}
	if(right-left > 1){
		vector<int> L,R;
		int mid=(left+right)/2;
		L = mergeSort(v, left, mid);
		R = mergeSort(v, mid, right);
		return merge(L, R);
	}
	
}
int main() {
	vector<int> v;
	int len, ele;
	cout<<"<.....Merge Sort.....>"<<endl;
	cout<<"Enter the length of array:";
	cin>>len;
	cout<<"Enter the element of array:"<<endl;
	for(int i=0; i<len; i++){
		cout<<"element "<<i<<":";
		cin>>ele;
		v.push_back(ele);
	}
	cout<<"sorted array:";
	vector<int> ds = mergeSort(v, 0, len);
	for(int i=0; i<ds.size(); i++)
		cout<<ds[i]<<" ";
	return 0;
}

