# Se Programar ====> APUNTES DE RUBY

# 1-Definir un OBJETO

module Norita
end

# 2-Definir metodo (Es decir cosas que esten adentro de pepita)

module Pepita
    def self.cantar!
    end
    def self.comer_lombriz!
    end
    def self.volar_en_circulos!
    end

end

# Un método es, entonces, la descripción de qué hacer cuando se recibe un mensaje del mismo nombre.
# Dos cosas muy importantes a tener en cuenta :
# Todos los métodos comienzan con def y terminan con end. Si nos falta alguna de estos dos la computadora no va a entender nuestra solución.
# Todos los métodos que pertenezcan al mismo objeto van dentro del mismo module.     

# 3- Definir ATRIBUTO con el @ que seria como un valor adentro de pepita y que pasa con energia si vuela en circulos.

module Pepita
    @energia = 100
  
    def self.volar_en_circulos!
      @energia = @energia - 10   #Como la operación @energia = @energia - 10 es tan común, se puede escribir @energia -= 10. Como te imaginarás, también se puede hacer con la suma.zzz
    end
end

  #PRACTICA
  #Sabiendo esto:

    #cambiá la definición del método volar_en_circulos! para que utilice la expresión simplificada;
    #definí la versión correcta del método comer_lombriz!, que provoca que Pepita gane 20 puntos de energía;
module Pepita
        @energia = 100
      
        def self.volar_en_circulos!
            @energia -= 10
        end
      
        def self.comer_lombriz!
          @energia  += 20
        end
end    

  #PRACTICA 
  #Como te dijimos, Pepita podía volar a diferentes ciudades. Y cuando lo hace, cambia su ciudad actual, además de perder 100 unidades de energía. Las distintas ciudades vas a poder verlas en la Biblioteca.
  #Con esto en mente:

    #Creá un atributo ciudad en Pepita: la ciudad donde actualmente está nuestra golondrina.
    #Hacé que la ciudad inicial de pepita sea Iruya.
    #Definí un método volar_hacia! en Pepita, que tome como argumento otra ciudad y haga lo necesario.
      #¡Dame una pista!
    #Al parámetro de volar_hacia! tenés que darle un nombre. Podrías llamarlo ciudad, pero eso colisionaría con el nombre del atributo ciudad. Así que te proponemos otros nombres: una_ciudad o, mejor, destino;
    module Iruya
    end
    
    module Obera
    end
    
    module GralLasHeras
    end
    
    module Calamuchita
    end
    
    module Ushuaia
    end

module Pepita
        @energia = 100
      
        def self.volar_en_circulos!
            @energia -= 10
        end
      
        def self.comer_lombriz!
          @energia  += 20
        end
      
        @ciudad = Iruya
      
        def self.volar_hacia! destino
          @energia -=100
          @ciudad = destino
        end
      
end    

# 4 - Utilizacion del METODO DE ACCESO (ACCESOR) - (sirve para poder consultar sobre un atributo en la consola)

#Antes te mostramos que si enviamos el mensaje energia, fallará:

#>  Pepita.energia
#undefined method `energia' for Pepita:Module (NoMethodError)

#El motivo es simple: los atributos NO son mensajes.

#Entonces, ¿cómo podríamos consultar la energía de Pepita? Definiendo un método, ¡por supuesto!

module Pepita
   #...atributos y métodos anteriores...

   def self.energia
      @energia
   end
end

# 5 - Definimos ESTADO es el conjunto de atributos... este mismo es privado por eso al llamarlo en la consola los atributos no aparecen almenos q declaremos un def
      #ej:

      #module Pepita
        # @energia = 100
        # @ciudad = Obera
      
        #...etc...
      #end

# 6 - VALOR ABSOLUTO utilizamos abs (sirve para medir por ejemplo en km cuanto tenemos de un punto al otro sin tener en cuenta cuando los numeros son negativos)
      #ej : 17.abs


#> (-17).abs
#=> 17

#> (1710 - 1040).abs
#=> 670

#> (1040 - 1710).abs
#=> 670

#> (1040 - 1710).abs / 2
#=> 335

# 7 - DELEGAR una responsabilidad. En el ejercicio anterior vimos que un objeto (en ese caso, Pepita) le puede enviar mensajes a otro que conozca (en ese caso, ciudades como Obera o BuenosAires):

module Pepita
  # ...etc...

  def self.volar_hacia!(destino)
    @energia -= (@ciudad.kilometro - destino.kilometro).abs / 2
    @ciudad = destino
  end
end

# Esto se conoce como delegar una responsabilidad, o simplemente, delegar: la responsabilidad de saber en qué kilómetro se encuentra es de la ciudad, y no de Pepita.

# A veces nos va a pasar que un objeto tiene un método muy complejo, y nos gustaría subdividirlo en problemas más chicos que el mismo objeto puede resolver. Pero, ¿cómo se envía un objeto mensajes a sí mismo?

# Un objeto puede enviarse un mensaje a sí mismo fácilmente usando self como receptor del mensaje.

module Pepita
  # ...etc...

  def self.volar_hacia!(destino)
    self.gastar_energia! destino #¡Ojo! No hicimos Pepita.gastar_energia!(destino)
    @ciudad = destino
  end

  def self.gastar_energia!(destino)
    @energia -= (@ciudad.kilometro - destino.kilometro).abs / 2
  end
end

# 8 - CONDICIONAL PARA TRUE O FALSE - Utilizamos al final de declarar el self un signo de interrogacion.

# Ej:  ¿Te acordás de Pepita? Bueno, aunque no lo creas, también cambia de estados de ánimo. En nuestro modelo de Pepita, vamos a representar simplemente dos estados posibles: cuando está débil y cuando está feliz.
# ¿Y cuándo ocurre eso?
# Pepita está débil si su energía es menor que 100.
# Pepita está feliz si su energía es mayor que 1000.
# Completá los métodos debil? y feliz? de Pepita.
module Pepita
  @energia = 1000

  def self.energia
    @energia 
  end

  def self.volar_en_circulos!
    @energia -= 10
  end
  
  def self.comer_alpiste!(gramos)
    @energia += gramos * 15
  end  

  def self.debil?
    @energia<100
  end
  
  def self.feliz?
    @energia>1000
  end
end

# En Ruby, es una convención que los mensajes que devuelven booleanos (o sea, verdadero o falso) terminen con un ?.
# Intentá respetarla cuando crees tus propios mensajes, acordate que uno de los objetivos del código es comunicar nuestras ideas a otras personas... y las convenciones, muchas veces, nos ayudan con esto.

# 9 - ALTERNATIVA CONDICIONAL utilizamos if en ruby tmb.

 #Ej:
 module Jose
  def self.acomodar_habitacion!
    self.ordenar!
    if self.tiene_sabanas_sucias?
      self.cambiar_sabanas!
    end
    self.tender_la_cama!
  end
end

# 10 - ALTERNATIVA CON ELSE Y TIMES.

# Hay veces que con un if alcanza, pero otras queremos hacer algo si no se cumple una condición. Como ya te podrás imaginar, donde hay un if ¡cerca anda un else!

module Jardinero
  def self.cuidar!(planta)
    if planta.necesita_agua?
      3.times { self.regar! planta }
    else
      self.sacar_bichos! planta
    end
  end
end
# ¿Y ese times qué es?

# Es un mensaje que entienden los números que sirve para ejecutar una porción de código varias veces. En este caso regaríamos 3 veces la planta recibida como argumento.