#include<bits/stdc++.h>
using namespace std;
void combinationSum(vector<int> &v, vector<int> &c, vector<vector<int>> &ds, int i, int n, int target){
	if(i>=n){
		if(target==0) ds.push_back(c);
		return;
	}
	if(v[i] <= target){
		c.push_back(v[i]);
		combinationSum(v, c, ds, i+1, n, target-v[i]);
		c.pop_back();
	}
	combinationSum(v, c, ds, i+1, n, target);
}
int main() {
	vector<int> v{2, 3, 2, 7}, c;
	vector<vector<int>> ds;
	combinationSum(v, c, ds, 0, v.size(), 7);
	for(int i=0; i<ds.size(); i++){
		for(int j: ds[i]) cout<<j<<" ";
		cout<<endl;
	}
	return 0;
}

