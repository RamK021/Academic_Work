#include<bits/stdc++.h>
using namespace std;
int main() {
	vector<int> v{234,543,654,34,1243},ds;
	int count=0;
	for(int i=0;i<v.size();i++){
		if(to_string(v[i]).length() %2 != 0){
			count++;
		}
	}
	cout<<"count="<<count;
	return 0;
}

