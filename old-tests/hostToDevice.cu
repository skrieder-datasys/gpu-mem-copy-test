#include <stdio.h>

//__global__ void kernel( void ) {
  // does nothing
//}

int main(int argc, char** argv) {
  
  // default the loop count to equal 1
  int loopCount = 1;

  // take in a command line arg to set the loop count
  if(argc > 1){
    loopCount = atoi(argv[1]);
  }

  // delcare two variables
  int host_a;
  int *dev_a;

  // get the size of an int for the cuda malloc
  int size = sizeof(int);

  // malloc on the device
  cudaMalloc((void **)&dev_a, size);

  // loop over the loop count and copy to device
  for(int i = 0; i < loopCount; i++){
    cudaMemcpy(dev_a, &host_a, size, cudaMemcpyHostToDevice);
  }

  // call an empty kernel
  //kernel<<<1,1>>>();

  // free device memory
  cudaFree(dev_a);

  // return with no errors
  return 0;
}
