#include<bits/stdc++.h>
using namespace std;
int solve(vector<vector<int>> &arr, int i, int j){
    int sum=0;
    for(int s=i; s<(i+3); s++){
        if(s == i+1){
            sum += arr[i+1][j+1];
            continue;
        }
        for(int t=j; t<(j+3); t++){
            sum += arr[s][t];
        }
    }
    cout<<sum<<endl;
    return sum;
}
int hourglassSum(vector<vector<int>> &arr) {
    int sum = 0, flag;
    for(int i=0; i<4; i++){
        for(int j=0; j<4; j++){
            flag = solve(arr, i, j);
            if(i==0 && j==0) sum = flag;
            else if(flag > sum) sum = flag;
        }
    }
    return sum;
}
int main() {
	vector<vector<int>> arr{{-1, -1, 0, -9, -2, -2},
	                        {-2, -1, -6, -8, -2, -5},
							{-1, -1, -1, -2, -3, -4},
							{-1, -9, -2, -4, -4, -5},
							{-7, -3, -3, -2, -9, -9},
							{-1, -3, -1, -2, -4, -5}};
	cout<<hourglassSum(arr);
	return 0;
}

