int main(void)
{
        int i = 0;
        int j = 23;

        int *x = (int *)300;

        for(i=0;i<10;i++)
                x[i] = j++;
        
        return;
}
