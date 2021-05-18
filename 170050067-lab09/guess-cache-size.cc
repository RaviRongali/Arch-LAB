#include <stdio.h>
#include <stdlib.h>
#include <time.h>

using namespace std;

int main()
{
	int guess_size = 2;
	double timeTaken;
	clock_t start;
	for (int i = 0; i < 27; ++i)
	{
		int *arr = (int*)malloc(guess_size*sizeof(int));
		int index = 0;
		start =clock();
		// struct timeval tim, tim1;
		// double t1, t2;
		// int j;
		// gettimeofday(&tim, NULL);
		// t1 = 1000000.0*tim.tv_sec + tim.tv_usec;

		for (int j = 0; j < 100000; j++)
		{
			arr[index] = 0;
			index = (index + 97)%guess_size;
		}
		// gettimeofday(&tim1, NULL);
		// t2 = 1000000.0*tim1.tv_sec + tim1.tv_usec;
		timeTaken=(double)(clock()-start)/CLOCKS_PER_SEC;
		printf("%d,%.8f \n",i,timeTaken);
		guess_size = guess_size*2;
	}
	return 0;
}