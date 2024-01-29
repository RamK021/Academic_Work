#include<iostream>
using namespace std;
class Account{
	private:
		int balance; //Instance Member variable
		static float rateOfinterest; // Static Member variable/Class variable
	public:
		void setBalance(int b){
			balance = b;
		}
		static void setRateOfInterest(float roi){
			rateOfinterest = roi;
		}
};
float Account::rateOfinterest = 3.5;
int main() {
	Account a1, a2;
	// If we want to access variable "rateOfinterest" without object help than we need static function.
	Account::setRateOfInterest(4.5);
	return 0;
}

