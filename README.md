# Actividad4-Moviles  
Juego en parejas 

Para el planteamiento de esta **Actividad 4**, se propone el desarrollo de una aplicación **Android** que implemente un **juego interactivo para dos jugadores**, cumpliendo con los requisitos y lineamientos establecidos por el profesor.  
El objetivo principal es demostrar el uso de **componentes modernos de interfaz**, una **lógica de juego bien estructurada** y un **manejo correcto del estado** dentro de la aplicación.

---

## Descripción general  
El proyecto consiste en crear un **juego local para dos jugadores**, que se ejecute en un mismo dispositivo.  
Cada jugador podrá interactuar por turnos, mientras la aplicación se encarga de validar los movimientos, mostrar el progreso y determinar el resultado (ganador o empate).  

El diseño debe ser **intuitivo, visualmente atractivo y fácil de usar**, incorporando retroalimentación visual, animaciones y una estructura clara basada en buenas prácticas de desarrollo Android.

---

## Características principales  
La aplicación deberá incluir los siguientes elementos:

- **Sistema de turnos:** Alternancia visual y funcional entre los dos jugadores.  
- **Sistema de puntuación:** Registro de puntos o victorias según la mecánica del juego.  
- **Validación de movimientos:** Solo se permitirán jugadas válidas según las reglas.  
- **Detección de victoria o empate:** Identificación automática del resultado al finalizar una partida.  
- **Reinicio de partida:** Opción para comenzar una nueva partida sin cerrar la app.  
- **Interfaz intuitiva:** Diseño claro que permita comprender fácilmente el estado actual del juego.  

---

## Lógica y arquitectura recomendada  
Para garantizar un desarrollo estructurado, se recomienda implementar el patrón **MVVM (Model-View-ViewModel)**, separando la lógica del juego de la interfaz.  

**Sugerencias técnicas:**
- Lenguaje: **Kotlin**  
- UI: **Jetpack Compose** (recomendado)  
- Manejo de estado: `StateFlow`, `LiveData` o `mutableStateOf`  
- Persistencia (opcional): `DataStore` o `Room`  
- Control de rotación y configuración mediante ViewModel  


