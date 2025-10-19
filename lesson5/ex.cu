#include <stdio.h>

__global__ void hello_from_gpu()
{
    const int bid = blockIdx.x + blockIdx.y * gridDim.x + blockIdx.z * gridDim.x * gridDim.y;
    const int tid = threadIdx.x + threadIdx.y * blockDim.x + threadIdx.z * blockDim.x * blockDim.y;
    const int id  = bid * gridDim.x * gridDim.y * gridDim.z + tid;

    printf("print from block_id %d, thread id %d, global id %d.\n",bid, tid, id);
}

int main(void)
{
    dim3 grid_size(3,3,3);
    dim3 block_size(3,3,3);

    printf("print from cpu!!!");

    hello_from_gpu<<<grid_size, block_size>>>();
    cudaDeviceSynchronize();

    return 0;
}