#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

void *thread_function(void *arg) {
    // Código del hilo
    printf("Nuevo hilo creado.\n");
    return NULL;
}

int main() {
    pid_t pid;
    pthread_t thread_id;

    pid = fork(); // Primer fork()

    if (pid == 0) { // Proceso hijo
        fork(); // Segundo fork() en el proceso hijo
        pthread_create(&thread_id, NULL, thread_function, NULL); // Crear un hilo en el proceso hijo
    }
    
    fork(); // Tercer fork() en el proceso original y en el proceso hijo del primer fork()

    // Esperar a que el hilo termine ... olo para evitar terminar el proceso antes que el hilo
    if (pid == 0) {
        pthread_join(thread_id, NULL);
    }

    return 0;
}
