# so1_actividades_201900619

# Tipos de Kernel y sus diferencias
|                  | Núcleos Monolíticos                                   | Micro-núcleos                                           | Núcleos Híbridos                                       | Exo-núcleos                                               |
|----------------------------------|-------------------------------------------------------|---------------------------------------------------------|--------------------------------------------------------|-----------------------------------------------------------|
| **Definición**                   | Un solo componente ejecutable maneja todas las funciones del sistema operativo. | Divide funciones del sistema operativo en módulos pequeños que se ejecutan en el espacio de usuario o kernel mínimo. | Combina características de núcleos monolíticos y micro-núcleos, con funciones críticas en el espacio del núcleo y otras en el espacio de usuario. | Exponen directamente los recursos del hardware a las aplicaciones, permitiendo un mayor control por parte de las aplicaciones. |
| **Espacio de ejecución**         | Todas las funciones se ejecutan en el espacio del núcleo. | Algunas funciones se ejecutan en el espacio del núcleo mínimo, mientras que otras se ejecutan en el espacio de usuario. | Funciones críticas en el espacio del núcleo, otras en el espacio de usuario. | No tiene un espacio de ejecución específico para funciones del sistema; las aplicaciones gestionan directamente los recursos. |
| **Comunicación entre componentes**| A menudo, se comunica directamente a través de llamadas a funciones. | La comunicación entre módulos puede implicar más sobrecarga debido a la necesidad de cruzar la barrera del espacio de usuario y núcleo mínimo. | Comunicación entre componentes críticos y no críticos puede variar según la implementación. | Puede haber una mínima comunicación, ya que las aplicaciones gestionan directamente los recursos. |
| **Ejemplos de sistemas operativos** | Linux, Windows (hasta cierto punto), FreeBSD. | QNX, Minix. | Windows NT, macOS (XNU).  | - |


# User vs Kernel Mode

| Característica          | Modo Usuario | Modo Kernel    |
|-------------------------|--------------|----------------|
| **Definición**          | Ejecución de aplicaciones de usuario. | Ejecución del núcleo del sistema operativo. |
| **Acceso a Recursos**   | Limitado a recursos específicos. | Acceso completo a todos los recursos del sistema. |
| **Privilegios**         | Privilegios limitados. | Privilegios elevados para operaciones críticas. |
| **Protección del Sistema**| No puede realizar operaciones críticas. | Puede realizar operaciones críticas del sistema. |
| **Ejecución de Instrucciones** | Ejecuta instrucciones de alto nivel. | Ejecuta instrucciones de bajo nivel y gestiona operaciones críticas. |
| **Cambios de Contexto**  | Más frecuentes, utilizado por aplicaciones. | Menos frecuentes, reservado para operaciones críticas. |
| **Ejemplos de Tareas**   | Ejecución de programas de usuario. | Gestión de interrupciones, control de dispositivos, asignación de recursos. |

# Interrupciones vs Traps

| Característica         | Interrupciones               | Traps                           |
|------------------------|-----------------------------|---------------------------------|
| **Origen**             | Externo, proviene de hardware o dispositivos. | Interno, generado por instrucciones específicas. |
| **Reacción del Sistema** | Cambia el flujo de ejecución a un controlador de interrupciones. | Capturar eventos o condiciones específicas dentro del software. |
| **Propósito**          | Manejar eventos externos que requieren atención inmediata. | Control de errores y eventos específicos en el software. |
| **Ejecución de Instrucciones** | Manejo de eventos como entrada de dispositivos o errores de hardware. | Control de errores y eventos específicos en el software. |
| **Ejemplos**          | Interrupción de temporizador, interrupción de disco. | División por cero, acceso a memoria no válido. |

