#include <stdio.h>

int main(unsigned x)
{
	int b;
	for(b=0; x!=0; x>>=1)
		if(x&01)
			b++;
		printf("%.0f\n", b);
}