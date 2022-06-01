/* ************************************************************************** */
/** Descriptive File Name

  @File Name
    interfaz.h

  @Description
 Implementa las tareas relacionadas con la interfaz de usuario
 */
/* ************************************************************************** */



/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

/* This section lists the other files that are included in this file.
 */
#include <stdbool.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include "../mcc_generated_files/usb/usb_device.h"
#include "../mcc_generated_files/usb/usb.h"
#include "../mcc_generated_files/usb/usb_device_cdc.h"
#include "../mcc_generated_files/rtcc.h"
#include "../Platform/WS2812.h"


/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif


    /* ************************************************************************** */
    /* ************************************************************************** */
    /* Section: Constants                                                         */
    /* ************************************************************************** */
    /* ************************************************************************** */


    /* ************************************************************************** */
    /** buffer

      @Summary
        Buffer que se utiliza para recibir cosas del USB.
    
      @Description
         Esta variable se utiliza para acceder a los datos obtenidos desde el USB. El tamaño es 255 ya que por la documentación
         es el máximo permitido.
      
     */
static uint8_t buffer[255];

 /** menu

      @Summary
        Un array que contiene el menú principal.
    
      @Description
         Este array contiene al menú principal, se usa para poder modificiar el menú con mas facilidad y mantener limpio el código.
      
     */
static char menu[] = "MENU:\n -Para fijar fecha y hora presiona 1\n -Para encender y apagar un LED presiona 2 \n -Para consultar el estado del último LED presiona 3";

    // *****************************************************************************
    // *****************************************************************************
    // Section: Data Types
    // *****************************************************************************
    // *****************************************************************************


    // *****************************************************************************

    /** app_register_t

      @Summary
     Estructura para llevar el control de los datos del LED.
    
      @Description
     Esta estructura se utiliza en todo el sistema para compartir los datos del LED que fue modificado.
     Se controla el numero del LED, su color y el tiempo de modificacion.
     */
    typedef struct {
   /*  */
uint8_t led;
/* Entero que corresponde al número del LED, entre 0 y 7. */
uint8_t color;     
/* Entero que corresponde al número del color del LED, 0-Blanco 1-Rojo 2-Azul 3-Verde 4-Negro. */
uint32_t time;
/* Entero que corresponde a la fecha en que fue modificado. */
bool ledModificado;
/* Booleano que indica si el LED fue modificado o no.*/
} app_register_t;

/** Estados de la Máquina de estados de la interfaz.
    
      @Description
        Ennumerado con los distintos estados de la interfaz.
       
     */
typedef enum {
    /*  */
    INICIAL, 
    /* Estado inicial de la máquina, espera a que le pasen algun dato para mostrar el menú, también lo muestra pasados 15 seg. */
    MOSTRAR_MENU, 
    /* Estado que muestra el menú principal. */        
    RECIBIR_RESPUESTA, 
    /* Estado que recibe una respuesta, y envía al usuario al estado deseado. */
    CAMBIAR_FECHA, 
   /* Estado donde se encuentran las funcionalidades de cambio de fecha. */
    ENCENDER_RGB, 
   /* Estado donde se encuentran las funcionalidades para encender un led específico. */
    ESTADO_RGB, 
   /* Estado donde es posible revisar el estado del ultimo led. */
   ESTADO_FECHA_INVALIDA,
            ESTADO_HORA_INVALIDA,
} ESTADO_INTERFAZ;

typedef enum {
    /*  */
    CARTEL_INGRESO_FECHA, 
    /* Estado que muestra el cartel de ingreso de fecha. */    
    RECIBIR_RESPUESTA_FECHA, 
    /* Estado que espera por una fecha. */    
    CARTEL_INGRESO_HORA,
    /* Estado que muestra el cartel para ingresar una hora.. */    
    RECIBIR_RESPUESTA_HORA,
    /* Estado que espera por una hora. */    
    CONFIGURAR_RTCC,
    /* Estado que configura el RTCC de la placa. */    
     SALIR_ERROR,       
} ESTADO_FECHA;

typedef enum {
    /*  */
    CARTEL_RGB,
    /* Estado que muestra el cartel de ingreso de fecha. */
    RECIBIR_RESPUESTA_RGB,

    ERROR_LED,
    /* Estado que espera por una fecha. */
    CARTEL_COLOR_RGB,
    /* Estado que muestra el cartel para ingresar una hora.. */
    RECIBIR_RESPUESTA_COLOR,
    ERROR_COLOR,
    /* Estado que espera por una hora. */
    ENCENDER_LED,
} ESTADO_ENCENDER_RGB;

    // *****************************************************************************
    // *****************************************************************************
    // Section: Functions
    // *****************************************************************************
    // *****************************************************************************


    // *****************************************************************************
    /**
      @Function
        bool usbListo(void)
     
      @Summary
     Retorna verdadero si el USB está listo.
     
      @Description
     Chequea que el dispositivo esté en estado configuarado y no se encuentre suspendido.
     Si cumple con las condiciones llama a la función void CDCTxService(void) y retorna un booleano.
     
      @Precondition
        None.
     
      @Returns
        Retorna un valor booleano según el estado del USB. 

     */
 static bool usbListo(void);
 
 
 
  /**
      @Function
        bool enviarUnDato(uint8_t* unDato)

      @Summary
       Retorna verdadero si envía unDato al USB. 
   
      @Description
       Esta funcion envía Datos al USB y retorna un valor booleano. Para realizar esto utiliza USBUSARTIsTxTrfReady().   
     
      @Precondition
        None.
     
      @Returns
        Retorna un valor booleano según el resultado de la operación del envío.

     */
static bool enviarUnDato(uint8_t* unDato);



/**
      @Function
       bool recibirUnDato(void)

      @Summary
       Retorna verdadero si recibe datos del USB.
   
      @Description
       Esta funcion revisa el tamaño del buffer para determinar si recibí algun dato desde el USB, si lo recibí entonces devuelve verdadero. 
     
      @Precondition
        None.
     
      @Returns
        Retorna un valor booleano según el resultado de la operación de recibir.

     */
static bool recibirUnDato(void);



/**
      @Function
       uint8_t recibirDeUSB(void)
   
      @Description
       Esta funcion retorna los datos recibidos del USB.
     
      @Precondition
        None.
     
      @Returns
        Retorna los datos recibidos del USB. 

     */
static uint8_t recibirDeUSB(void);

/**
      @Function
       bool validarFecha(int dia, int mes, int anio)

      @Summary
       Retorna verdadero si la fecha pasada por parámetro es válida.
   
      @Description
       Esta funcion hace un chequeo del dia, mes y año pasados por parámetro, revisando que los datos sean coherentes.
       ACLARACION: No chequea si el año es bisiesto, por tanto, febrero puede tener 28 o 29 días indistintamente.
     
      @Precondition
        None.
     
      @Returns
        Retorna un valor booleano dependiendo si la fecha pasada sea válida o no.

     */
static bool validarFecha(int dia, int mes, int anio);

/**
      @Function
       bool validarHora(int hora, int min, int seg)

      @Summary
       Retorna verdadero si la hora pasada por parámetro es válida.
   
      @Description
       Esta funcion hace un chequeo de la hora, los minutos y los segundos pasados por parámetro, revisando que sean valores coherentes.
       En caso afirmativo retorna verdadero.
     
      @Precondition
        None.
     
      @Returns
        Retorna un valor booleano dependiendo si la hora pasada es válida o no.

     */
static bool validarHora(int hora, int min);

/**
      @Function
       void encenderLED(app_register_t unLed)

      @Summary
      Enciende el led correspondiente.
   
      @Description
       Esta funcion configura el color del LED según su número. Luego llama a la función  WS2812_send() para encender los LEDS.
     
      @Precondition
        None.
     
      @Returns
       None.

     */
static void encenderLED(app_register_t unLed);

    // *****************************************************************************
    // *****************************************************************************
    // Section: Inteface Functions
    // *****************************************************************************
    // *****************************************************************************


    // *****************************************************************************

/**
      @Function
       void cambiarFecha(void)

      @Summary
      Máquina de estado que controla la primera opcion de la interfaz, la configuracion de la fecha y hora.
   
      @Description
     Esta máquina de estados controla la primera opcion de la interfaz, recibe la fecha y hora del usuario, las valida y configura el RCC
     
      @Precondition
        None.
     
      @Returns
        None.

     */
bool cambiarFecha(void);

/**
      @Function
       void interfaz(void)

      @Summary
      Máquina de estado principal que controla la interfaz y las demas máquinas de estado.
   
      @Description
     Esta máquina de estados controla toda la interfaz de usuario. Segun los datos pasados por el usuario es que tarea realiza.
     Controla el menú y se debe llamar en el main junto con el parpadeo del LED A.
     
      @Precondition
        None.
     
      @Returns
 Verdadero si cambia la fecha. falso si no.

     */
void interfaz(void);

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif
/* *****************************************************************************
 End of File
 */
