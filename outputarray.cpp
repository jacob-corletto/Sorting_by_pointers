#include <iostream>
using namespace std;

extern "C" {
  void output_array(double arr[],long size);
}

// int main(){
//   void output_array(double arr[],long size);

//   return 0;
// }

void output_array(double arr[],long size){
    for (int i = 0; i < size;i++){
      cout<<("%6.5lf",&arr[i])<<endl;
    };
}