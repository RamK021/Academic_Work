#include<bits/stdc++.h>
using namespace std;
bool binarySearch(vector<int> v, int l, int u, int key){
	bool flag = false;
	while(flag != true && l<u){
		int mid = (l+u)/2;
		if(v[mid]==key){
			flag = true;
			return true;
		}
		if(key < v[mid]){
			u = mid;
		}
		else{
			l = mid+1;
		}
	}
	if(flag == false){
		return false;
	}
}
//Binary Search using Recursion...
bool rbinarysearch(vector<int> &v, int k, int l, int u){
	bool flag = false;
	if(l<u){
		int mid=(l+u)/2;
		if(v[mid]==k){
			return true;
		}
		if(k < v[mid]){
			return rbinarysearch(v, k, l, mid);
		}
		else{
			return rbinarysearch(v, k, mid+1, u);
		}
	}
	if(flag==false) return false;
}

int main() {
	vector<int> v{2, 4, 6, 8, 10, 12, 14, 16};
	int key;
	cout<<"Enter key:";
	cin>>key;
	if(binarySearch(v, 0, v.size(), key)){
		cout<<"Found!!";
	}
	else{
		cout<<"NOT Found!!";
	}
	return 0;
}

