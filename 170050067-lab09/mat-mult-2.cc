#include<stdio.h>
#define SIZE 100


static double A[SIZE][SIZE],B[SIZE][SIZE],C[SIZE][SIZE];

	
int main(){
	for(int l=0;l<SIZE;l++){
		B[l][l] = 2;
		C[0][l] = l;}

	for(int i=0;i<SIZE;i++){
		for(int j=0;j<SIZE;j++){
			for(int k=0;k<SIZE;k++){
				A[i][j] = A[i][j] + B[i][k]*C[k][j];
				printf("0 %p\n",(void*)&(A[i][j]));
				printf("0 %p\n",(void*)&(B[i][k]));
				printf("0 %p\n",(void*)&(C[k][j]));
				printf("1 %p\n",(void*)&(A[i][j]));
			}
		}
	}
	return 0;
}

