#include <iostream>
using namespace std;

void output_array(double arr[],long size) {
  for (int i = 0; i < size;i++){
    cout<<("%6.5lf",&arr[i])<<endl;
  };

}