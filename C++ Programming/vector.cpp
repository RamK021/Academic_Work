#include<bits/stdc++.h>
using namespace std;
int main() {
	vector<int> arr{1, 2, 3, 4, 5};
	int d=4;
	vector<int> ans(arr.size());
	int i=0, j=arr.size()-1;
	while(i<j){
		swap(arr[i], arr[j]);
		i++;
		j--;
	}
    for(int i=0; i<arr.size(); i++){
        ans[(i+d)%arr.size()] = arr[i];
    }
    cout<<"arr:";
	//for(int i: arr) cout<<i<<" ";
	cout<<endl<<"ans:";
	for(int j: ans) cout<<j<<" ";	
	return 0;
}

