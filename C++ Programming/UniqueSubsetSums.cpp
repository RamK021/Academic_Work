#include<bits/stdc++.h>
using namespace std;
void solve(vector<int> &nums, vector<int> &ds, vector<vector<int>> &ans, int ind){
	ans.push_back(ds);
	for(int i = ind; i<nums.size(); i++){
		if(i!=ind && nums[i] == nums[i-1]) continue;
		ds.push_back(nums[i]);
		solve(nums, ds, ans, i+1);
		ds.pop_back();
	}	
}
int main() {
	vector<int> nums={1, 2, 2, 3}, ds;
	vector<vector<int>> ans;
	solve(nums, ds, ans, 0);
	for(int i=0; i<ans.size(); i++){
		for(int j: ans[i]) cout<<j<<" ";
		cout<<endl;
	}
	return 0;
}

