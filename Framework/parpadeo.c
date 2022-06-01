/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */


/* This section lists the other files that are included in this file.
 */

#include  "parpadeo.h"



/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
/* ************************************************************************** */

/* ************************************************************************** */

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
void parpadeoLED (void)
{
   static  LED_STATE estado = LED_PRENDIDO;
   static ut_tmrDelay_t timer = { .state = UT_TMR_DELAY_INIT };
    switch(estado)
    {
        case(LED_PRENDIDO):
            if (UT_delayms(&timer, 400))                       
            {estado= LED_APAGADO; 
            LED_A_SetLow();
            }
             break;
             
         case (LED_APAGADO):       
            if (UT_delayms(&timer, 800))
            {
             estado= LED_PRENDIDO;
             LED_A_SetHigh();
            }
            break;
    }
}


/* *****************************************************************************
 End of File
 */