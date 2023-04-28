#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

int infinite_while(void);

/**
 * main - a program that creates 5 zombie processes
 * Return: 0 for success
 */
int main(void)
{
	int a;
	pid_t ZOMBIE_PID;

	for (a = 0; a <= 4; a++)
	{
		ZOMBIE_PID = fork();
		if (ZOMBIE_PID < 0)
		{
			exit(EXIT_FAILURE);
		}
		else if (ZOMBIE_PID == 0)
		{
			exit(EXIT_SUCCESS);
		}
		printf("Zombie process created, PID: %d\n", ZOMBIE_PID);
	}
	return (infinite_while());
}
/**
 * infinite_while - an infinite while loop
 * Return: 0 for success
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}
