#include <stdio.h>
#define MAX 50

int main(){


int a[MAX][MAX];
int aRows, aColumns;

int b[MAX][MAX];
int bRows, bColumns;

int product[MAX][MAX];

int sum=0;
int i,j,k;

printf ("Enter the rows and Columns of matrix a: \n");
scanf ("%d %d", &aRows, &aColumns);

printf ("Enter elements of matrix a: \n");
    for (int i = 0; i < aRows; i++) {
        for (int j = 0; j < aColumns; j++) {
            scanf("%d", &a[i][j]);
        }
    }


printf ("Enter the rows and Columns of matrix b: ");
scanf ("%d %d", &bRows, &bColumns);
    // check if Rows of Matrix a = Columns of Matrix b
    if (bRows != aColumns){
        printf("Sorry, the matrices cannot be multiplied.\n");
    }
    else {
    // fill matrix b
    printf ("Enter elements of matrix b: \n");
    for (int i = 0; i < bRows; i++) {
        for (int j = 0; j < bColumns; j++) {
            scanf("%d", &b[i][j]);
        }
    }
    }

    printf("The product of the two matrices is:\n");
    // calculate matrix product
    for (int i = 0; i < aRows; i++) {
        for (int j = 0; j < bColumns; j++) {
            for (int k = 0; k < bRows; k++) {
                sum += a[i][k] * b[k][j];
            }
            // store the result in the product matrix
            // index i = row number of matix a
            // index j = column number of matrix b 
            product[i][j] = sum;
            sum = 0;
        }
    }
 return 0;
}