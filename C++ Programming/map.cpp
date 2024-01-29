#include<bits/stdc++.h>
using namespace std;
int main() {
	map<string, int> num = {
		{"zero",0}, 
		{"one",1}, 
		{"two",2}, 
		{"three",3}, {"four",4}, {"five",5}, {"six",6}, {"seven",7}, {"eight",8}, {"nine",9}
    };
	string input1 = "one two double three four five double one two" , temp, result;
	vector<string> digits;
	input1.push_back(' ');
	for(int i=0; i<input1.length(); i++){
		if(input1[i]==' '){
			digits.push_back(temp);
		    temp = "";
			continue;
		}
		temp += input1[i];
	}
	for(int i=0; i<digits.size(); i++){
		if(digits[i] == "double"){
			result += to_string(num[digits[i+1]]);
			result += to_string(num[digits[i+1]]);
		}
		else{
			//cout<<"digit";
			if(i>0 && digits[i-1] == "double"){
				continue;
			}
			result += to_string(num[digits[i]]);
		}
	}
	cout<<result;
	return 0;
}

/*
for(auto it=num.begin(); it != num.end(); it++){
		cout<<it->first<<":"<<it->second<<endl;
	}
*/
