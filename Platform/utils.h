 /* ************************************************************************** */
/** Descriptive File Name


  @File Name
 utils.h

  @Summary
 Contiene las estructuras, enum y el delays utilizado.

  @Description
  Contiene las estructuras, enum y el delays utilizado.
 
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
#include"../mcc_generated_files/tmr2.h"    
#include"../mcc_generated_files/pin_manager.h"


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

    /*  A brief description of a section can be given directly below the section
        banner.
     */


    // *****************************************************************************
 /**
  @Summary
  Enum para controlar los estados del delay.
      
  */
    
 typedef enum
{
UT_TMR_DELAY_INIT,  
        /* Estado inicial del delay. */
UT_TMR_DELAY_WAIT
        /* Estado que corresponde cuando el delay está esperando que pase el tiempo correspondiente.*/
}UT_TMR_DELAY_STATE; 

    
    
 typedef struct
{
uint32_t startValue;      
UT_TMR_DELAY_STATE state;
}ut_tmrDelay_t;
    
    /** Descriptive Data Type Name

      @Summary
     Tipo de dato para utilizar el Delay.
    
      @Description
       ut_tmrDelay_t tiene un uint32_t para marcar el valor de inicio y un estado del enum UT_TMR_DELAY_INIT o UT_TMR_DELAY_WAIT.
 .
     */
   

    // *****************************************************************************
    // *****************************************************************************
    // Section: Functions
    // *****************************************************************************
    // *****************************************************************************
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
bool UT_delayms(ut_tmrDelay_t * p_timer, uint32_t p_ms);



/* *****************************************************************************
 End of File
 */
