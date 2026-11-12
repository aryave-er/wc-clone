#include <stdio.h>
#include <ctype.h>

#define OUT 0
#define IN 1

long lc,wc,cc;

void count(FILE *fp){
    int c, state=OUT;
    lc=wc=cc=0;
    while((c=getc(fp))!=EOF){
        ++cc;
        if(c=='\n'){
            ++lc;
        }
        if(isspace(c)){
            state=OUT;
        }else if(state==OUT){
            state=IN;
            ++wc;
        }
    }
}

int main(int argc, char *argv[]){
    int status=0;
    if(argc==1){
        count(stdin);
        printf("%8ld%8ld%8ld\n", lc, wc, cc);
        return 0;
    }
    for(int i=1;i<argc;i++){
        FILE *fp=fopen(argv[i],"r");
        if(fp==NULL){
            perror(argv[i]);
            status=1;
            continue;
        }
        count(fp);
        fclose(fp);
        printf("%8ld%8ld%8ld %s\n", lc, wc, cc, argv[i]);
    }
    return status;
}