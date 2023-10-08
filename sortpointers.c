#include <stdio.h>

// double* sort_array(double* arr[], long size);

extern "C"{
  void sort_array(double* arr[], int size){
    double *temp;
    int swapped;

    for(int step = 0; step < size-1; ++step){
      swapped = 0;
      for (int i = 0; i < size-step-1; ++i){
        if (*arr[i] > *arr[i+1]){
          temp = arr[i];
          arr[i] = arr[i+1];
          arr[i+1] = temp;

          // printf("this is temp %n \n",temp);
          // printf("this is arr[i] %n \n",arr[i]);
          // printf("this is arr[i+1] %n \n",arr[i+1]);

          swapped =1;
        }
      }
      if (swapped ==0){
        break;
      }
    }
  }
}
// int main(){
//   a = 1;
//   b = 2;
//   c = 3;
//   double*arr[] = {&a,&b,&c};
//   sort_array(arr,3);
//   return 0;
// }