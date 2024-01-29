#include<bits/stdc++.h>
using namespace std;
int main() {
	vector<int> v={12, 10, 23, 10, 45, 25, 10};
	int c = count(v.begin(), v.end(), 10), i=1;
	for(auto it=v.begin(); it!=v.end(); it++){
		if(*it == 10){
			v.erase(it);
			it--;
		}
	}
	while(i<=c){
		v.push_back(10);
		i++;
	}
	for(int i:v){
		cout<<i<<" ";
	}
	return 0;
}

