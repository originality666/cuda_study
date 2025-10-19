#include <stdio.h>

int main(void)
{
    // 检测计算机GPU的数量
    int iDeviceCount = 0;
    cudaError_t error = cudaGetDeviceCount(&iDeviceCount);

    if(error != cudaSuccess || iDeviceCount == 0)
    {
        printf("no CUDA compatible GPU device found.\n");
        exit(-1);
    }
    else
    {
        printf("The count of GPUs is %d.\n",iDeviceCount);
    }

    //设置执行的GPU
    int iDev = 0;
    error = cudaSetDevice(iDev);
    if(error != cudaSuccess)
    {
        printf("fail to set GPU 0 for computing.\n");
    }
    else
    {
        printf("GPU 0 is on ready for computing.\n");
    }

    return 0;
}