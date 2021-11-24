/***  Trabajo final  ***/
/***  Experimento de Millikan  ***/
/*** Avance de proyecto



/* Declaramos las constantes a utilizar*/

// Dac = Densidad del aceite
// Dai = Densidad del aire
float Dac, Dai;
// constante de la gravedad
float g;

/* Declaramos las variables a itulizar
** Estas variables van a ser el medio para
** poder interactuar con el usuario final
** en teimpo real
*/ 
// R = radio de la gota
float R;
// ViscAire = viscosidad del aire 
float ViscAire;
// Volt = diferencia de potencial
float Volt = 1;
// dp = Distancia entre las placas
float dp;
// v =velocidad de la gota 
float v;
// Qe = carga deleelctron
float Qe;
/*Variables que no se utilizan en teoria
** pero que seran necearias para la simualción
*/
//
//determninara que el comportamiento de la gota
//Se utiliza para elejr el tipo de movimiento
int caida;
// Suma de fuerzas
float Sf;     
// Color del fondo bg = backgroud
int bg = 255;


/*
** Declaramos las variables que se utilizaran el el programa
** Fuerzas:
** Fe = fuerza electrica
** Fg = fuerza de gravedad
** Ff = fuerza de fricción
** Fa = fuerza de arquimidez
*/

float Fe= 4;
float Fg =3;
float Ff =0.8;
float Fa =1;

void setup()
{
 size(200,600);
 background(bg);
 
}


/*
** Esta funcion diibuja y evalua en tiempo real los
** paramietros que el suuario ingrese
** Esta función se estara evaluando siempre 
** que el programa este en funcionamiento
*/float x=20;
void draw()
{
/* Decidimos que tipo de movimento se va a simular*/
  tmovGota(Fe, Fg, Volt);
 /* El switch controlara que tipo de caida
 ** es la que experimenta la gota
 ** 1 caida libre, SIN CAMPO ELECTRICO
 ** 2 fuerza electrica menor a fuerza de gravedad fe<<fg
 ** 3 fe=fg
 ** 4 fe>> fg
 */
 background(255);
 switch(caida)
 {
    case 1: 
   
            Sf  = Fg - Ff - Fa;
            fill(0);
            stroke(0);
            
            //Dibujamos un circulo
            //circle(posiscion x, posicion y, radio)
            circle(50, (height/2)+x, 10);
            x= x+Sf;
            
            break;
             
    
    case 2:
            Sf  = Fg - Ff - Fa- Fe;
            fill(0);
            stroke(0);
            
            //Dibujamos un circulo
            //circle(posiscion x, posicion y, radio)
            circle(50, (height/2)+x, 10);
            x= x+Sf;
            break;
            
    case 3:
            Sf  = Fg - Fa- Fe;
            fill(0);
            stroke(0);
            
            //Dibujamos un circulo
            //circle(posiscion x, posicion y, radio)
            circle(50, (height/2)+x, 10);
            x= x+Sf;
            break;
    
    case 4:
            Sf  = Fg + Ff - Fa- Fe;
            fill(0);
            stroke(0);
            
            //Dibujamos un circulo
            //circle(posiscion x, posicion y, radio)
            circle(50, (height/2)+x, 10);
            x= x+Sf;
            break;
       
         
 }
  
}

/* funsión para determinar
** que tipo de movimiento se va a simular
** la funcion recibe 3 parametros Fe, Fg y Volt
*/
void tmovGota(float fe, float fg, float volt)
{
  if(volt == 0)
  {
    caida =1;
  }else if(volt == 1 && fe < fg)
  {
    caida = 2;
  }else if(volt == 1 && fe == fg)
  {
    caida = 3;
  }else if(volt == 1 && fe > fg)
  {
    caida = 4;
  }
}
