/* ************************************************************************** */
/** Descriptive File Name

  @File Name
    interfaz.c

  @Summary
 Contiene todas las funciones requeridas para la interfaz de usuario.

  @Description
 Contiene 4 maquinas de estado, para la intefaz, para editar la fecha y hora, para encender o apagar un led y para revisar el estado 
 del último led modificado. A su vez contiene las funciones auxiliares a estas máquinas de estado.
 */

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */

#include "interfaz.h"
#include "../Platform/utils.h"  //Solo está aca porque usaba el delay para abrir el menú

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
/* ************************************************************************** */

/** arrayLEDS

  @Summary
 Es un array con todos los LEDS RGB de la placa.
    
  @Description
 Este array se utiliza para configurar cada LED RGB, del 0 al 7, los elementos son de la estructura ws2812_t, conteniendo
 tres uint8_t, el numero de red, el numero de green y el numero de blue.
 Se utiliza junto con la función WS2812_send() para encender los LEDS. 
 */
static ws2812_t arrayLEDS[8];  

/** ledNuevo

  @Summary
 Es una estructura para guardar la información del LED modificado.
    
  @Description
 Es una estructura del tipo app_register_t, que contiene toda la información necesaria cuando se modifica un LED y poder utilizarla
 entre las distintas maquinas de estado. Los datos que contienen son tres uint8_t distintos, para el número de led, para el número de color
 y para la fecha y hora en que fue modificado. Ademas para saber si ya fue modificado o aún no se utiliza un booleano.
 */
static app_register_t ledNuevo;

/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

/* ************************************************************************** */

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
static bool usbListo() {
    if ((USBGetDeviceState() < CONFIGURED_STATE) || (USBIsDeviceSuspended() == true)) {
        return false;
    } else {
        CDCTxService(); // Unicamente la utilizo en usbListo porque es una vez por loop según la documentación.
        return true;
    }
}

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
static bool enviarUnDato(uint8_t* unDato) {
    if (USBUSARTIsTxTrfReady()) {
        putsUSBUSART(unDato);
        return true;
    }
    return false;
}

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
static bool recibirUnDato() {
    uint8_t num = getsUSBUSART(buffer, sizeof (buffer));
    if (num > 0) {
        return true;
    }
    return false;
}

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
static uint8_t recibirDeUSB() { 
    memset(buffer, 0, sizeof (buffer)); //utilizo memset para limpiar el buffer antes de utilizarlo, así me aseguro que esté vacío antes
    uint8_t num = getsUSBUSART(buffer, sizeof (buffer));
    return num;
}

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
static bool validarFecha(int dia, int mes, int anio) {
    if (mes > 0 && mes < 13) {
        if (anio > 1899 && anio <= 2022) { 
            if ((mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12) && dia <= 31 && dia > 0) { //Si los meses son de 31 dias entonces retorna verdadero
                return true;
            } else if ((mes == 4 || mes == 6 || mes == 9 || mes == 11) && dia <= 30 && dia > 0) { // si los meses son de 30 dias retorno verdadero
                return true;
            } else if (mes == 2 && dia <= 29 && dia > 0) { // si febrero tiene hasta 29 dias retorno verdadero 
                return true;
            }
        }
    }
    return false;
}

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
static bool validarHora(int hora, int min) {
    if (hora >= 0 && hora <= 23) {
        if (min >= 0 && min <= 59) {
            return true;
        }
    }
    return false;
}

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
static void encenderLED(app_register_t unLed) {
    if (unLed.color == 0) {
        arrayLEDS[unLed.led] = WHITE;
    }
    if (unLed.color == 1) {
        arrayLEDS[unLed.led] = RED;
    }
    if (unLed.color == 2) {
        arrayLEDS[unLed.led] = BLUE;
    }
    if (unLed.color == 3) {
        arrayLEDS[unLed.led] = GREEN;
    }
    if (unLed.color == 4) {
        arrayLEDS[unLed.led] = BLACK;
    }
    WS2812_send(arrayLEDS, 8);
}


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

// *****************************************************************************

/** 
  @Function
    bool cambiarFecha()

  @Summary
     Máquina de estado que controla la primera opcion de la interfaz, la configuracion de la fecha y hora.
 */
bool cambiarFecha() {
    static ESTADO_FECHA estadoFE = CARTEL_INGRESO_FECHA;
    static struct tm fecha;
    static uint8_t respuestaFecha;
    static uint8_t respuestaHora;

    switch (estadoFE) {
        case (CARTEL_INGRESO_FECHA):
            if (enviarUnDato("\n\n -Ingresa una fecha dd/mm/aaaa:")) {
                estadoFE = RECIBIR_RESPUESTA_FECHA;
            }
            return false;
        case (RECIBIR_RESPUESTA_FECHA):
            respuestaFecha = recibirDeUSB();
            if (respuestaFecha > 0) { //RECIBI DATOS 
                if (sscanf(buffer, "%u/%u/%u", &(fecha.tm_mday), &(fecha.tm_mon), &(fecha.tm_year)) == 3) {

                    if (validarFecha(fecha.tm_mday, fecha.tm_mon, fecha.tm_year)) {
                        estadoFE = CARTEL_INGRESO_HORA;

                    } else {
                        estadoFE = ESTADO_FECHA_INVALIDA;
                    }
                } else {
                    estadoFE = ESTADO_FECHA_INVALIDA;
                }
            }

            return false;
        case (ESTADO_FECHA_INVALIDA):
            if (enviarUnDato("\n -Lo siento, Fecha ingresada NO válida. \n")) {
                estadoFE = CARTEL_INGRESO_FECHA;
            }
            return false;
        case(CARTEL_INGRESO_HORA):
            if (enviarUnDato("\n\n -Ingresa una hora en forma HH:MM :")) {
                estadoFE = RECIBIR_RESPUESTA_HORA;
            }
            return false;
        case (RECIBIR_RESPUESTA_HORA):
            respuestaHora = recibirDeUSB();
            if (respuestaHora > 0) { //RECIBI DATOS
                if (sscanf(buffer, "%u:%u", &(fecha.tm_hour), &(fecha.tm_min)) == 2) {
                    int hora = fecha.tm_hour;
                    int min = fecha.tm_min;
                    if (validarHora(fecha.tm_hour, fecha.tm_min)) { //
                        estadoFE = CONFIGURAR_RTCC;
                    } else {
                        estadoFE = ESTADO_HORA_INVALIDA;
                    }
                } else {
                    estadoFE = ESTADO_HORA_INVALIDA;
                }
            }
            return false;
        case (ESTADO_HORA_INVALIDA):
            if (enviarUnDato("\n -Lo siento, Hora ingresada NO válida. \n")) {
                estadoFE = CARTEL_INGRESO_HORA;
            }
            return false;

        case (CONFIGURAR_RTCC):
            fecha.tm_mon = fecha.tm_mon - 1; //mes de 0 a 11
            fecha.tm_year = fecha.tm_year - 1900; //año a partir de 1900 
            RTCC_TimeSet(&fecha);
            if (enviarUnDato("\n\n-Hora configurada correctamente!!\n\n")) {
                estadoFE = CARTEL_INGRESO_HORA;
                return true;
            }
            return false;
    }

}

/** 
  @Function
    bool encenderRGB()

  @Summary
     Máquina de estado que controla la segunda opción de la interfaz, el encendido de un LED específico.
 */
bool encenderRGB() {
    static ESTADO_ENCENDER_RGB estadoV = CARTEL_RGB;
    static uint8_t respuestaLed;
    static uint8_t respuestaColor;
    static struct tm fechaConsulta;

    switch (estadoV) {
        case(CARTEL_RGB):
            if (enviarUnDato("\n\n -Elegir LED a encender (0-7):\n")) {
                estadoV = RECIBIR_RESPUESTA_RGB;
            }
            return false;
        case(RECIBIR_RESPUESTA_RGB):
            respuestaLed = recibirDeUSB();
            if (respuestaLed > 0) {
                if (respuestaLed == 1) {
                    if (buffer[0] == '0') {
                        ledNuevo.led = 0;
                        estadoV = CARTEL_COLOR_RGB;
                        return false;
                    }
                    if (buffer[0] == '1') {
                        ledNuevo.led = 1;
                        estadoV = CARTEL_COLOR_RGB;
                        return false;
                    }
                    if (buffer[0] == '2') {
                        ledNuevo.led = 2;
                        estadoV = CARTEL_COLOR_RGB;
                        return false;
                    }
                    if (buffer[0] == '3') {
                        ledNuevo.led = 3;
                        estadoV = CARTEL_COLOR_RGB;
                        return false;
                    }
                    if (buffer[0] == '4') {
                        ledNuevo.led = 4;
                        estadoV = CARTEL_COLOR_RGB;
                        return false;
                    }
                    if (buffer[0] == '5') {
                        ledNuevo.led = 5;
                        estadoV = CARTEL_COLOR_RGB;
                        return false;
                    }
                    if (buffer[0] == '6') {
                        ledNuevo.led = 6;
                        estadoV = CARTEL_COLOR_RGB;
                        return false;
                    }
                    if (buffer[0] == '7') {
                        ledNuevo.led = 7;
                        estadoV = CARTEL_COLOR_RGB;
                        return false;
                    }
                    if (buffer[0] != '0' || buffer[0] != '1' || buffer[0] != '2' || buffer[0] != '3' || buffer[0] != '4' || buffer[0] != '5' || buffer[0] != '6' || buffer[0] != '7') {
                        estadoV = ERROR_LED;
                    }
                }
                if (respuestaLed > 1) {
                    estadoV = ERROR_LED;
                }
            }
            return false;
        case(ERROR_LED):
            if (enviarUnDato("\n -Lo siento, LED indicado NO válido. ")) {
                estadoV = CARTEL_RGB;
            }
            return false;
        case(CARTEL_COLOR_RGB):
            if (enviarUnDato("\n -Elegir el color del LED:\n0-Blanco\n1-Rojo\n2-Azul\n3-Verde\n4-Negro")) {
                estadoV = RECIBIR_RESPUESTA_COLOR;
            }
            return false;
        case (RECIBIR_RESPUESTA_COLOR):
            respuestaColor = recibirDeUSB();
            if (respuestaColor > 0) {
                if (respuestaColor == 1) {
                    if (buffer[0] == '0') {
                        ledNuevo.color = 0;
                        estadoV = ENCENDER_LED;
                        return false;
                    }
                    if (buffer[0] == '1') {
                        ledNuevo.color = 1;
                        estadoV = ENCENDER_LED;
                        return false;
                    }
                    if (buffer[0] == '2') {
                        ledNuevo.color = 2;
                        estadoV = ENCENDER_LED;
                        return false;
                    }
                    if (buffer[0] == '3') {
                        ledNuevo.color = 3;
                        estadoV = ENCENDER_LED;
                        return false;
                    }
                    if (buffer[0] == '4') {
                        ledNuevo.color = 4;
                        estadoV = ENCENDER_LED;
                        return false;
                    }
                    if (buffer[0] != '0' || buffer[0] != '1' || buffer[0] != '2' || buffer[0] != '3' || buffer[0] != '4') {
                        estadoV = ERROR_COLOR;
                    }
                }
                if (respuestaColor > 1) {
                    estadoV = ERROR_COLOR;
                }
            }
            return false;
        case (ERROR_COLOR):
            if (enviarUnDato("\n -Lo siento, el color indicado NO es válido.\n ")) {
                estadoV = CARTEL_COLOR_RGB;
            }
            return false;
        case (ENCENDER_LED):
            RTCC_TimeGet(&fechaConsulta);
            ledNuevo.time = (uint32_t) mktime(&fechaConsulta);
            ledNuevo.ledModificado = true;
            encenderLED(ledNuevo);
            if (enviarUnDato("\n\n -Led encendido correctamente!!\n\n")) {
                estadoV = CARTEL_RGB;
                return true;
            }
            return false;
    }
}

/** 
  @Function
    bool consultarEstado()

  @Summary
     Máquina de estado que controla la tercera opcion de la interfaz, revisa el estado de modificación del ultimo LED.
 */
bool consultarEstado() {
//los tamaños de estos array me aseguran que entra todo el texto correctamete.
static char salida[80];
static char color [35];
    if (ledNuevo.ledModificado) {
        time_t fechaTimeT = (time_t) ledNuevo.time;
        static struct tm *fechaDeCambio;
        fechaDeCambio = gmtime(&fechaTimeT);
        if (fechaDeCambio->tm_year == 206 && fechaDeCambio->tm_mon == 1 && fechaDeCambio->tm_mday == 7) //fecha de default
        {
            fechaDeCambio->tm_year = 122;
            fechaDeCambio->tm_mday = 29;
            fechaDeCambio->tm_mon = 4;
        }
        strftime(salida, sizeof (salida), "\n\n -Fecha de modificación: %Ec", fechaDeCambio);
        if (ledNuevo.color == 0) {
            sprintf(color, "\n -Led nro: %u, color: Blanco\n\n", ledNuevo.led, ledNuevo.color);
        }
        if (ledNuevo.color == 1) {
            sprintf(color, "\n -Led nro: %u, color: Rojo\n\n", ledNuevo.led, ledNuevo.color);
        }
        if (ledNuevo.color == 2) {
            sprintf(color, "\n -Led nro: %u, color: Azul\n\n", ledNuevo.led, ledNuevo.color);
        }
        if (ledNuevo.color == 3) {
            sprintf(color, "\n -Led nro: %u, color: Verde\n\n", ledNuevo.led, ledNuevo.color);
        }
        if (ledNuevo.color == 4) {
            sprintf(color, "\n -Led nro: %u, color: Negro\n\n", ledNuevo.led, ledNuevo.color);
        }
        strcat(salida, color);
        if (enviarUnDato(salida)) {
            return true;
        }
    } else {
        if (enviarUnDato("\n\n -Aún no se modificó ningun LED. \n\n")) {
            return true;
        }
    }
    return false;
}

/** 
  @Function
    void interfaz()

  @Summary
     Máquina de estado que controla la intefaz de usuario, la cual debe ser llamada en el main.
 */
void interfaz() {
    static ESTADO_INTERFAZ estadoIN = INICIAL;
    uint8_t respuesta;
    static ut_tmrDelay_t timer2 = {.state = UT_TMR_DELAY_INIT};
    if (usbListo()) {
        switch (estadoIN) {

            case (INICIAL):
                //if (recibirUnDato() || UT_delayms(&timer2, 15000))  //DESACTIVE EL DELAY PARA NO GENERAR CONFLICTOS SI SE PASAN LOS 15 SEG Y NO SE ABRE EL PUERTO COM
                if (recibirUnDato()) {
                    estadoIN = MOSTRAR_MENU;
                }
                break;
            case(MOSTRAR_MENU):
                if (USBUSARTIsTxTrfReady()) {
                    putsUSBUSART(menu);
                }

                estadoIN = RECIBIR_RESPUESTA;
                break;

            case (RECIBIR_RESPUESTA):
                respuesta = recibirDeUSB();
                if (respuesta > 0) {
                    if (respuesta == 1) {
                        if (buffer[0] == '1') {
                            estadoIN = CAMBIAR_FECHA;
                            break;
                        }
                        if (buffer[0] == '2') {
                            estadoIN = ENCENDER_RGB;
                            break;
                        }
                        if (buffer[0] == '3') {
                            estadoIN = ESTADO_RGB;
                            break;
                        }
                        if (buffer[0] != '1' || buffer[0] != '2' || buffer[0] != '3') 
                            estadoIN = MOSTRAR_MENU;
                    }
                    if (respuesta > 1) { 
                        estadoIN = MOSTRAR_MENU;
                    }
                }
                break;

            case (CAMBIAR_FECHA):
                if (cambiarFecha()) {
                    estadoIN = INICIAL;
                }
                break;
            case (ENCENDER_RGB):
                if (encenderRGB()) {
                    estadoIN = INICIAL;
                }
                break;
            case (ESTADO_RGB):

                if (consultarEstado()) {
                    estadoIN = INICIAL;
                }
                break;
        }
    }
}
/* *****************************************************************************
 End of File
 */
