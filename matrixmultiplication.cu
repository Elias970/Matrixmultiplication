// Multiply square matrices on GPU with CUDA and return the product

#include <cstdlib>
#include <iostream>
#include <cassert>
using namespace std;

// Pass three matrices ind and the dimensions

__global__ void matrixMul(int *A, int *B, int *C, int n)
// find out which block is being calculated and iterate through each element
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    // Iterate through rows and colums
    C[i*n+j] = 0;
    for (int k = 0; k < n; k++)
    {
        C[i*n+j] += A[i*n+k] * B[k*n+j];
    }
}

// Initialize a square matrix of size n with random values between 0 and 100
void init_matrix(int *matrix, int n) {
    int i, j;
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            matrix[i * n + j] = rand() % 100;
        }
    }
}

int main (){
int dimensions = 1 << 10;
// Allocate memory for "dimensions elements"
size_t bytes = dimensions * dimensions * sizeof(int);
// Allocate memory for matrices
int *mat_a, *mat_b, *output;
cudaMallocManaged(&mat_a, bytes);
cudaMallocManaged(&mat_b, bytes);
cudaMallocManaged(&output, bytes);
//Initialize matrices
init_matrix(mat_a, dimensions);
init_matrix(mat_b, dimensions);
// Allocate threads for output
int threads = 16;
int blocks = (threads * threads) / dimensions;
// Kernel parameters
dim3 THREADS (threads, threads);
dim3 BLOCKS (blocks, blocks);

// Launch the kernel
matrixMul <<<BLOCKS,THREADS>>>(mat_a, mat_b, output, dimensions);
cudaDeviceSynchronize();
cout<<"Matrix multiplication completed"<<endl;
  cudaFree(mat_a);
  cudaFree(mat_b);
  cudaFree(output);
return 0;
}
