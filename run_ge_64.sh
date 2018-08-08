for s in 64 128 192 256 320 384
do
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>> DEG = " $s ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    nvcc main.cu ChunkTesting.o -o main -DSIZE=$s -gencode arch=compute_30,code=sm_30
    echo ">>> shmem_org"
    ./main 16 16
    ./main 16 16
    ./main 16 16
    nvcc main.cu ChunkTesting.o -o main -DSIZE=$s -DMP -gencode arch=compute_30,code=sm_30
    echo ">>> shmem_opt"
    ./main 16 16
    ./main 16 16
    ./main 16 16
    nvcc main.cu ChunkTesting.o -o main -DSIZE=$s -DSHUFFLE -gencode arch=compute_30,code=sm_30
    echo ">>> rc_org"
    ./main 16 16
    ./main 16 16
    ./main 16 16
    nvcc main.cu ChunkTesting.o -o main -DSIZE=$s -DSHUFFLE -DMP -gencode arch=compute_30,code=sm_30
    echo ">>> rc_opt"
    ./main 16 16
    ./main 16 16
    ./main 16 16
done
