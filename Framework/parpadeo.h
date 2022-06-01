/* ************************************************************************** */
/** Descriptive File Name


  @File Name
 parpadeo.h

  @Summary
 Contiene las estructuras y las funciones utilizadas para el parpadeo del LED A.

  @Description
 Este archivo contiene todas las funciones necesarias para utilizar la maquina de estado parpadeo(), en el main. 
 De manera que funcione de forma no bloqueante.
 
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
#include "../Platform/utils.h"


/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif


    /* ************************************************************************** */
    /* ************************************************************************** */
    /* Section: Constants                                                         */
    /* ************************************************************************** */
    /* ************************************************************************** */

    /*  A brief description of a section can be given directly below the section
        banner.
     */


    /* ************************************************************************** */
    /** Descriptive Constant Name

      @Summary
        Brief one-line summary of the constant.
    
      @Description
        Full description, explaining the purpose and usage of the constant.
        <p>
        Additional description in consecutive paragraphs separated by HTML 
        paragraph breaks, as necessary.
        <p>
        Type "JavaDoc" in the "How Do I?" IDE toolbar for more information on tags.
    
      @Remarks
        Any additional remarks
     */



    // *****************************************************************************
    // *****************************************************************************
    // Section: Data Types
    // *****************************************************************************
    // *****************************************************************************

/**
  @Summary
  Enum sencillo para controlar los estados del LED.
      
  */

typedef enum
{
LED_APAGADO, 
        /* LED se encuentra apagado. */
LED_PRENDIDO 
        /* LED se encuentra encendido. */
}LED_STATE;    
       

    // *****************************************************************************
    // *****************************************************************************
    // Section: Interface Functions
    // *****************************************************************************
    // *****************************************************************************
/** 
  @Function
 void parpadeoLED(vod)

  @Summary
 Maquina de estado que hace parpadear al LED A.

  @Description
Maquina de estado que hace parpadear al LED A. No es una función bloqueante, permite seguir ejecutando cosas en el main.
 * Utiliza un delay que tampoco es bloqueante para controlar el tiempo en el que el LED A debe estar prendido o apagado.
  @Returns
  None.

 
 */
void parpadeoLED (void);     
/* *****************************************************************************
 End of File
 */
