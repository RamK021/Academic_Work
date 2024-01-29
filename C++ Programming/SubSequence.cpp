#include<bits/stdc++.h>
using namespace std;
// subsequence({3,1,2}):{}, {3}, {1}, {2}, {3,1}, {1,2}, {3,2}, {3,1,2} but not {1,2,3}
// def: a contiguous/ non-contiguous sequences, which follow order
int SubSeqCountOfSumK(int i, vector<int> &v, int n, int sum, int s){
	if(i == n){
		if(s == sum) return 1;
		else return 0;
	}
	s += v[i];
	int r = SubSeqCountOfSumK(i+1, v, n, 2, s);
	s -= v[i];
	int l = SubSeqCountOfSumK(i+1, v, n, 2, s);
	return r+l;	
}
bool SubSeqOfAnyoneSumK(int i, vector<int> &v, vector<int> ds, int n, int sum, int s){
	if(i == n){
		if(s == sum){
			for(int i:ds) cout<<i<<" ";
			cout<<endl;
			return true;
		}
		return false;
	}
	ds.push_back(v[i]);
	s += v[i];
	if(SubSeqOfAnyoneSumK(i+1, v, ds, n, 2, s)==true) return true;
	ds.pop_back();
	s -= v[i];
	if(SubSeqOfAnyoneSumK(i+1, v, ds, n, 2, s)==true) return true;
	return false;	
}
void SubSeqOfSumK(int i, vector<int> &v, vector<int> ds, int n, int sum, int s){
	if(i == n){
		if(s == sum){
			for(int i:ds) cout<<i<<" ";
			cout<<endl;
		}
		return;
	}
	ds.push_back(v[i]);
	s += v[i];
	SubSeqOfSumK(i+1, v, ds, n, 2, s);
	ds.pop_back();
	s -= v[i];
	SubSeqOfSumK(i+1, v, ds, n, 2, s);	
}
void subsequence(int i, vector<int> &v, vector<int> ds, int n){
	if(i>=n){
		for(int it:ds){
			cout<<it<<" ";
		}
		if(ds.size()==0){
			cout<<"{}";
		}
		cout<<endl;
		return;
	}
	ds.push_back(v[i]);
	subsequence(i+1, v, ds, n); //take 
	ds.pop_back();
	subsequence(i+1, v, ds, n); //not-take
}
int main() {
	vector<int> v{1,1,2,0}, ds;
	SubSeqOfAnyoneSumK(0, v, ds, v.size(), 2, 0);
	return 0;
}

