#include<bits/stdc++.h>
using namespace std;
int fibonacci(int n){
	if(n <= 1){
		return n;
	}
	return fibonacci(n-1) + fibonacci(n-2);
}
bool checkPalindrome(string s, int i){
	if(i >= s.length()/2) return true;
	if(s[i] != s[s.length()-i-1]) return false;
	return checkPalindrome(s, i+1);
}
void reverseArray(vector<int> &v, int i, int j){
	if(i >= j){
		return; 
	}
	swap(v[i], v[j]);
	reverseArray(v, i+1, j-1);
}
int fact(int n){
	if(n==1){
		return 1;
	}
	return n*fact(n-1);
}
int sum(int n){  // functional
	if(n==0){
		return 0;
	}
	return n+sum(n-1);
}
void sumOfn(int i, int sum){ // parameterized 
	if(i < 1){
		cout<<sum;
		return;
	}
	sumOfn(i-1, sum+i);
}
void fun(int i, int n){
	if(i > n){
		return;
	}
	cout<<i<<endl;
	fun(i+1, n);
}
void funBack(int n){
	if(n < 1){
		return;
	}
	funBack(n-1);
	cout<<n<<endl;	// backtracking;
}
int main() {
	string s="bb";
	/*
	vector<int> v{1, 2, 3, 4, 5};
	cout<<"original array:";
	for(int i:v) cout<<i<<" ";
	reverseArray(v, 0, v.size()-1);
	cout<<endl<<"reversed array:";
	for(int i:v) cout<<i<<" ";
	*/
	//string s="madam";
	cout<<checkPalindrome(s, 0);
	//cout<<fibonacci(4);
	return 0;
}

