// #include <iostream>
// using namespace std;

// extern "C" {
//   void output_array(double* arr[],long size);
// }

// // int main(){
// //   void output_array(double arr[],long size);

// //   return 0;
// // }

// void output_array(double* arr[],long size){
//     for (long i = 0; i < size;i++){
//       cout<<("%2.8lf",*(arr[i])) <<endl;
//     };
// }
#include <stdio.h>
extern "C"{
  void output_array(double* arr[], int size){
    for (int i = 0; i < size;i++ ){
      printf("%lf \n",(*arr[i]));
    }
  }
}