#include <stdio.h>

__global__ void hello_from_gpu()
{
    const int bid = blockIdx.x;
    const int tid = threadIdx.x;
    const int id  = blockIdx.x * blockDim.x + threadIdx.x;

    printf("hello world from block_id %d, thread id %d, global id %d.\n",bid, tid, id);
}

int main(void)
{
    hello_from_gpu<<<3, 4>>>();
    cudaDeviceSynchronize();

    return 0;
}