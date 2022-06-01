/* ************************************************************************** */
/** Descriptive File Name

  @File Name
 utils.c

  @Summary
 Contiene funciones relacionadas con delays. 

  @Description
 Contiene un delay no bloqueante que utiliza el timer2 de la placa.
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

/* This section lists the other files that are included in this file.
 */

#include  "utils.h"

/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
/* ************************************************************************** */


/* ************************************************************************** */

/** 
  @Function
bool UT_delayms(ut_tmrDelay_t * p_timer, uint32_t p_ms)

  @Summary
    Delay no bloqueante que utiliza el timer2 de la placa.

  @Description
 Este delay permite al sistema utilizar los recursos cuando no se llegó al tiempo deseado, para esto utiliza una estructura ut_tmrDelay_t
 que contiene el valor inicial y el estado en el que se encuentra el delay. 

  @Precondition
 None.

  @Parameters
    @param  * p_timer: un puntero a una estructura ut_tmrDelay_t.
    
    @param param2 p_ms: un entero que será el tiempo en ms que debe funcionar el delay.

  @Returns
   Retorna true si ocurrió el tiempo y false en caso contrario.

 */
bool UT_delayms(ut_tmrDelay_t * p_timer, uint32_t p_ms){    //p_ms es el tiempo que quiero de delay
    switch (p_timer ->state){ 
        case (UT_TMR_DELAY_INIT):
            
            p_timer->startValue = TMR2_SoftwareCounterGet();
            p_timer->state=UT_TMR_DELAY_WAIT;
            break;
            
        case(UT_TMR_DELAY_WAIT):
            if((TMR2_SoftwareCounterGet()-p_timer->startValue) >=p_ms){ 
                        p_timer->state=UT_TMR_DELAY_INIT;
                        return true;
            }
            break;
    }
    return false;      
}

/* *****************************************************************************
 End of File
 */