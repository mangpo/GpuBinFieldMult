for s in 64 128 192 256 320 384
do
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>> DEG = " $s ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    nvcc main.cu ChunkTesting.o -o main -DSIZE=$s
    echo ">>> shmem_org"
    ./main 48 48
    ./main 48 48
    ./main 48 48
    nvcc main.cu ChunkTesting.o -o main -DSIZE=$s -DMP
    echo ">>> shmem_opt"
    ./main 48 48
    ./main 48 48
    ./main 48 48
    nvcc main.cu ChunkTesting.o -o main -DSIZE=$s -DSHUFFLE
    echo ">>> rc_org"
    ./main 48 48
    ./main 48 48
    ./main 48 48
    nvcc main.cu ChunkTesting.o -o main -DSIZE=$s -DSHUFFLE -DMP
    echo ">>> rc_opt"
    ./main 48 48
    ./main 48 48
    ./main 48 48
done
