#include<iostream>
#include<fstream>

using namespace std;

int main()
{
	char c=65;
	float n1,n2;
	ifstream input;
	input.open("D:\\study\\machine learning\\machine-learning-ex1\\ex1\\ex1data.txt");
	input>> n1>>c>>n2;
	cout<<n1<<endl<<n2<<endl<<c;
	return 0;
}
