#include <stdio.h>

int main(int argc, char **argv, char **envp)
{
  puts("Content-type: text/html\n\n");
  puts("<pre>");

  printf("Number of command line arguments: %d\n", argc-1);
  for (int i = 1; i < argc; i++)
    printf("%d: '%s'\n", i, argv[i]);

  puts("");
  puts("Environment variables:\n");
  for (; *envp; envp++)
    printf("%s\n", *envp);

  puts("</pre>"); 
  return(0);
}

