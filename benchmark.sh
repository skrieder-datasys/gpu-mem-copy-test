#! /bin/bash                                                                                                                                                                       

# do the overall test, this many times
for i in {1..1}
do
    loopCount=2
#echo "Benchmarking cudaMemcpy" > logs/log$i.txt

    # 1 through 8 for the sleeptimes
    for k in {1..24}
    do
#	echo "Loop Count Equals: " $loopCount >> logs/log$i.txt

	# run the test
	(/usr/bin/time -f "%e" ./hostToDevAsync $loopCount) 2>> logs/log$i.txt
#	(/usr/bin/time -f "%e" ./devToHostAsync $loopCount) 2>> logs/log$i.txt
#	(/usr/bin/time -f "%e" ./hostToDev $loopCount) 2>> logs/log$i.txt
#	(/usr/bin/time -f "%e" ./devToHost $loopCount) 2>> logs/log$i.txt

	# double the loop count
	loopCount=$(($loopCount*2))    
    done
done
