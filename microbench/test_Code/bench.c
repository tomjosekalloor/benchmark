#include <stdio.h>
int main() {
    int number, i , j;

    printf("Enter an integer: ");
    scanf("%d", &number);
    for(i = 0 ; i < number ; i++ ){
        j = i * number  ; 
    }
    if(j == 0) 
        printf("Wrong Answer") ;
    else 
        printf("%d", j);
}
