# This file was generated, do not modify it. # hide
using CUDA
using BenchmarkTools

const THREADS_PER_BLOCK = 256
# here, we won't bother checking sizes and so on
function mycopy!(A, B)
    ix = ((blockIdx().x-1)*blockDim().x) + threadIdx().x
    iy = ((blockIdx().y-1)*blockDim().y) + threadIdx().y
    if ix <= size(A)[1] && iy <= size(B)[2]
        @inbounds A[ix, iy] = B[ix, iy] #don't do bounds checking
    end
    return 
end
#set matrix size 1000 X 1000
nx = 1000
ny = 1000
threads = 10, 10, 1
blocks = ceil(Int64, nx / threads[1]), ceil(Int64, ny / threads[2]), 1
A = CUDA.fill(1.0f0, nx, ny)
#print(A)
B = CUDA.fill(0.0f0, nx, ny)
#print(B)
@benchmark CUDA.@sync @cuda threads=$threads blocks=$blocks mycopy!($A, $B)
#elapsedtime = @belapsed CUDA.@sync @cuda threads=$threads blocks=$blocks mycopy!($A, $B)
#CUDA.@sync @cuda threads=threads blocks=blocks mycopy!(A, B)
#print(A)