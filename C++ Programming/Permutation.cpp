#include<bits/stdc++.h>
using namespace std;
void permutation(vector<int> &v, vector<vector<int>> &ds, int i){
	if(i>=v.size()){
		ds.push_back(v);
		return;
	}
	for(int j = i; j<v.size(); j++){
		swap(v[i], v[j]);
		permutation(v, ds, i+1);
		swap(v[i], v[j]);
	}
}

int main()
{
	vector<int> v{1,2,3};
	vector<vector<int>> ds;
	int i=0;
	permutation(v, ds, i);
	sort(ds.begin(), ds.end());
	for(int i=0; i<ds.size(); i++){
		for(int j:ds[i]){
			cout<<j<<" ";
		}
		cout<<endl;
	}
	cout<<"next permutation:"<<endl;
    //sort(ds.begin(), ds.end());
    sort(ds.begin(), ds.end());
    for(int i=0; i<ds.size(); i++){
        if(v == ds[i]){
            int next = (i+1)%ds.size();
            if(ds[next] == v) v = ds[next+1];    
            else v = ds[next];
            break;
        }
    }
    for(int i: v) cout<<i<<" ";
	return 0;
}

