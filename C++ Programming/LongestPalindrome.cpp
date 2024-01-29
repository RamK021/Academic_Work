#include<bits/stdc++.h>
using namespace std;
bool checkPalindrome(string test, int i){
    if(i >= test.length()/2){
        return true;
    }
    if(test[i] != test[test.length()-1-i]){
        return false;
    }
    return checkPalindrome(test, i+1);
}
string longestPalindrome(string s) {
    string test, ans;
    int len=0;
    if(s.length() == 1) return s;
    for(int i=0; i<s.length(); i++){
        for(int j=0; j<s.length(); j++){
            test = s.substr(i, j+1);
            cout<<test<<endl;
            if(checkPalindrome(test, 0)){
                if(test.length() > len){
                    len = test.length();
                    ans = test;
                }
            }
        }
    }
    cout<<ans;
}
int main() {
	//string s="abcdbbfcba";
	string s="bb";
	longestPalindrome(s);
	return 0;
}

