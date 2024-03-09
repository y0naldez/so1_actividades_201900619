# # Actividad 5 - Prueba de Procesos e hilos


**Respuestas:**

a) **¿Cuántos procesos únicos son creados?**

-   1 proceso original.
-   1 primer hijo.
-   1 hijo del primer hijo.
-   1 duplicado del proceso original por el tercer `fork()`.
-   1 duplicado del primer hijo por el tercer `fork()`.

	En total, **5 procesos únicos** son creados.

b) **¿Cuántos hilos únicos son creados?**

-   Un único hilo es creado en el primer proceso hijo después del primer `fork()` y antes del segundo `fork()`.

	Entonces, en total, **1 hilo único** es creado.