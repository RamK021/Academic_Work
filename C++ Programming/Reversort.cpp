/*
Reversort(L):
for i=1 to length(L)-1
	j = position with the minimum value in L between i & length(L), inclusive
	Revese(L[i...j])
	cost += (j-i+1) --> calculate cost of reverse operation.
	
example: L = [4, 2, 1, 3]
		for i=1:
		element '1'(j=3 i.e., L[j]=1) is minimum thus reverse subarray L[1:3] 
		i.e., L = [1, 2, 4, 3], i++
		and so on...
*/
#include<bits/stdc++.h>
using namespace std;
int reversort(vector<int>& v){
	int cost = 0;
	for(int i=0; i<v.size()-1; i++){
		int min = *min_element(v.begin()+i, v.end());
		auto j = find(v.begin(), v.end(), min);
		reverse(v.begin()+i, j+1);
		cost += distance(v.begin(), j)-i+1;
	}
	return cost;
}
int main() {
	vector<int> v = {2, 4, 5, 3, 1};
	cout<<"unsorted array:";
	for(int i: v){
		cout<<i<<" ";
	}
	int cost = reversort(v);
	cout<<endl<<"sorted array  :";
	for(int i: v){
		cout<<i<<" ";
	}
	cout<<endl<<"cost:"<<cost;
	return 0;
}

