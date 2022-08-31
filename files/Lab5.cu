/*
    Author: Ting-Ying Yu
    Class: ECE4122
    Last Date Modified: Nov 21, 2021

    Description:
        2D Steady State Heat Conduction in a Thin Plate

        A CUDA program that determine the steady state heat distribution
        in a thin metal plate using synchronous iteration on a GPU using 
        Laplace's equation finite difference method.
        You will be solving Laplace's
    
    Code References:
        1) https://stackoverflow.com/questions/7876624/timing-cuda-operations
        2) https://github.com/NVIDIA/cuda-samples/blob/master/Samples/vectorAdd/vectorAdd.cu
        3) https://cpp.hotexamples.com/examples/-/-/cudaGetDeviceProperties/cpp-cudagetdeviceproperties-function-examples.html

*/

#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include <stdio.h>
#include <cuda_runtime.h>
#include <iomanip>      // std::setprecision
//#include <helper_cuda.h>
#include <iostream>
#include <memory>
#include <sstream>
#include <limits>
#include <climits>
#include <cstddef>
#include <cmath>
#include <stdlib.h> 
#include <ctype.h>
#include <unistd.h>
#include <assert.h>
#include <cuda.h>
#include <algorithm>

using namespace std;
bool is_numeric(char* & input, int & nInputNumber);

/*
 * Function: __global__ void UpdatingTemp(double* H, double* G, int N, int totalElements)
 * Description : Calculating the updated temperature by averaging the four neighboring mesh points
 */
__global__ void UpdatingTemp(double* H, double* G, int N, int totalElements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if ( (i > N - 1) && (i < totalElements - N) && (i % N != 0) && ((i + 1) % N != 0) )
    {
	    G[i] = 0.25 * ( H[i + 1] + H[i - 1] + H[i + N] + H[i - N] );
    }
}

/*
 * Function: __global__ void copyArray(double* H, double* G, int totalElements)
 * Description : Copy the array with updated temperature to the original array that stores temperatures
 */
__global__ void copyArray(double* H, double* G, int totalElements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < totalElements)
    {
	    H[i] = G[i];
    }
}

int main(int argc, char* argv[])
{
    // Open file
    ofstream outputFile("finalTemperatures.csv");

    int N = 0;
    int I = 0;
    int opt = 0;
    bool hasN = false;
    bool hasI = false;
    bool isNValid = false;
    bool isIValid = false;
    
    // If there is clearly no enough inputs
    if (argc < 4)
    {
        outputFile << "Invalid parameters, please check your values.\n";
        cout << "Invalid parameters, please check your values.\n";
        return -1;
    }


    // Check if all inputs are valid
    while ((opt = getopt (argc, argv, "N:I:")) != -1)
    {
        switch (opt)
        {
            case 'N':
                isNValid = is_numeric(optarg, N);

                if (N < 0 || !isNValid)
                {
                    outputFile << "Invalid parameters, please check your values.\n";
                    cout << "Invalid parameters, please check your values.\n";
                    return 0;
                }

                hasN = true;
                break;
            case 'I':
                isIValid = is_numeric(optarg, I);

                if (I < 0 || !isIValid)
                {
                    outputFile << "Invalid parameters, please check your values.\n";
                    cout << "Invalid parameters, please check your values.\n";
                    return 0;
                }
                hasI = true;
                break;

            default:
                outputFile << "Invalid parameters, please check your values.\n";
                cout << "Invalid parameters, please check your values.\n";
                return 0;
        }
        
    }
    
    if (!hasN || !hasI)
    {
        outputFile << "Invalid parameters, please check your values.\n";
        cout << "Invalid parameters, please check your values.\n";
        return 0;
    }

    cudaError_t err = cudaSuccess;

    // (0) Get plate dimensions
    int plateSideLength = N + 2;
    int totalElements = plateSideLength * plateSideLength;
    size_t size = totalElements * sizeof(double);

    // (1) Allocate CPU memory for the arrays
    double* h_H = (double*)malloc(size);
    double* h_G = (double*)malloc(size);

    if (h_H == NULL || h_G == NULL)
    {
        cout << "Memory allocations for Host failed" << endl;
        exit(EXIT_FAILURE);
    }

    // (2) Initialize the values for the arrays
    for (int i = 0; i < plateSideLength; i++)
    {
        for (int j = 0; j < plateSideLength; j++)
        {
            if ((i == 0) && (j > (0.3 * (plateSideLength - 1)) && (j < 0.7 * (plateSideLength - 1))))
            {
                // 100 degree condition
                h_H[i * plateSideLength + j] = 100.0;
            }
            else
            {
                h_H[i * plateSideLength + j] = 20.0;
            }
        }
    }

    // (3) Allocate GPU memory for array
    double* d_H = (double*)malloc(size);
    err = cudaMalloc((void**)&d_H, size);
    if (err != cudaSuccess)
    {
        cout << "Memory allocations for GPU failed" << endl;
        exit(EXIT_FAILURE);
    }
    double* d_G = (double*)malloc(size);
    err = cudaMalloc((void**)&d_G, size);
    if (err != cudaSuccess)
    {
        cout << "Memory allocations for GPU failed" << endl;
        exit(EXIT_FAILURE);
    }

    // (4) Send CPU data to GPU
    err = cudaMemcpy(d_H, h_H, size, cudaMemcpyHostToDevice);
    if (err != cudaSuccess)
    {
        cout << "Copying host vectors into host memory unsuccessful." << endl;
        exit(EXIT_FAILURE);
    }
    err = cudaMemcpy(d_G, h_H, size, cudaMemcpyHostToDevice);
    if (err != cudaSuccess)
    {
        cout << "Copying host vectors into host memory unsuccessful." << endl;
        exit(EXIT_FAILURE);
    }

    // (5) Kernel calculation
    int threadsPerBlock = 256;
    int blocksPerGrid = (totalElements + threadsPerBlock - 1)/threadsPerBlock;

    cudaEvent_t start;
    cudaEvent_t stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);

    // Timing:
    cudaEventRecord(start);

    // -> Main function
    for (int i = 0; i < I; i++)
    {
        UpdatingTemp<<<blocksPerGrid, threadsPerBlock>>>(d_H, d_G, plateSideLength, totalElements);
        copyArray <<<blocksPerGrid, threadsPerBlock>>>(d_H, d_G, totalElements);
        
	    err = cudaGetLastError();
    	if (err != cudaSuccess)
    	{
	    cout << "Kernel execusion failed" << endl;
            exit(EXIT_FAILURE);
    	}

    }
    cudaEventRecord(stop);

    // (6) Send GPU data to CPU
    err = cudaMemcpy(h_G, d_G, size, cudaMemcpyDeviceToHost);
    if (err != cudaSuccess)
    {
	    cout << "Unsuccessful copy to host device." << endl;
        exit(EXIT_FAILURE);
    }

    cudaEventSynchronize(stop);

    // (7) Print time (in ms)
    float time = 0;
    cudaEventElapsedTime(&time, start, stop);
    if (err != cudaSuccess)
    {
        exit(EXIT_FAILURE);
    }
    
    cout << fixed << showpoint;
    cout << setprecision(2);
    cout << time << endl;


    // (8) Save result to CSV file
    for(int i = 0; i < plateSideLength; ++i)
    {
        for(int j = 0; j < plateSideLength; ++j)
        {
            if (j != (plateSideLength - 1))
            {
                outputFile << to_string( h_G[i * plateSideLength + j] ) << ",";
            }
        }
        if (i != (plateSideLength - 1))
        {
            outputFile << "\n";
        }
    }

    // (9) Free GPU Memory
    err = cudaFree(d_H);
    if (err != cudaSuccess)
    {
        cout << "Free Memory fail." << endl;
        exit(EXIT_FAILURE);
    }
    err = cudaFree(d_G);
    if (err != cudaSuccess)
    {
        cout << "Free Memory fail." << endl;
        exit(EXIT_FAILURE);
    }

    // (10) Free host memory
    free(h_H);
    free(h_G);

    outputFile.close();

    return 1;
}

/*
 * Function: bool is_numeric(const string& input, unsigned long& nInputNumber)
 *   Description : This is a function (provided by Dr. Hurley on Piazza) to check and see if the input is valid
 *   Return      : Return true if the input is valid; otherwise, return false.
 *   Parameters  : 
 *      const string& input: the command line argument we want to check for its validity
 *      unsigned long& nInputNumber: the variable storing the number that user enters in the commandline
 */
bool is_numeric(char* & input, int & nInputNumber)
{
    
    string s = input;

    // Check special case first
    if ( s.compare( "0.0" ) == 0 )
    {
        nInputNumber = 0;
        return true;
    }

    // If all letter is digit number, it is valid
    bool bRC = std::all_of(s.begin(), s.end(),                    // http://www.cplusplus.com/reference/algorithm/all_of/
        [](unsigned char c) { return ::isdigit(c); }              // https://www.geeksforgeeks.org/lambda-expression-in-c/
    );                                                            // http://www.cplusplus.com/reference/cctype/isdigit/
    
    if (bRC)
    {
        // Valid! Place the number to the desired variable
        nInputNumber = std::stoi(input);                         // https://www.cplusplus.com/reference/string/stoul/
        return true;
    }
    else
    {
        // There are some digit that is not a number
        return false;

    }
    
    return false;

}