#include<bits/stdc++.h>
using namespace std;
// Memoization(Top-down approach): tends to store value of sub-problem in map/array.
int fibonacci(int n, vector<int> &dp){
	if(n<=1) return n;
	if(dp[n] != -1) return dp[n]; 
	return dp[n] = fibonacci(n-1, dp) + fibonacci(n-2, dp);
}
int main() {
	int n;
	cout<<"enter n:";
	cin>>n;
	vector<int> dp(n+1, -1);
	cout<< fibonacci(n, dp);
	return 0;
}
