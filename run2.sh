for s in 32
do
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>> DEG = " $s ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    nvcc main.cu ChunkTesting.o -o main -DSIZE=$s -gencode arch=compute_30,code=sm_30
    echo ">>> shmem_org"
    ./main 10 23
    echo ""
    ./main 10 23
    echo ""
    ./main 10 23
    nvcc main.cu ChunkTesting.o -o main -DSIZE=$s -DMP -gencode arch=compute_30,code=sm_30
    echo ">>> shmem_opt"
    ./main 10 23
    echo ""
    ./main 10 23
    echo ""
    ./main 10 23
    nvcc main.cu ChunkTesting.o -o main -DSIZE=$s -DSHUFFLE -gencode arch=compute_30,code=sm_30
    echo ">>> rc_org"
    ./main 10 23
    echo ""
    ./main 10 23
    echo ""
    ./main 10 23
    nvcc main.cu ChunkTesting.o -o main -DSIZE=$s -DSHUFFLE -DMP -gencode arch=compute_30,code=sm_30
    echo ">>> rc_opt"
    ./main 10 23
    echo ""
    ./main 10 23
    echo ""
    ./main 10 23
done
