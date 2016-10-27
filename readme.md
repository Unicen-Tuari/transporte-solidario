# App Transporte Solidario

## Instalación
* Definir Host Virtual transportesolidario.app ([Instrucciones] (https://docs.google.com/presentation/d/1SNkY0IxXc_Z6Up5qttfVeX6jH8K5Yf8xZXynS_1DJTY/edit?usp=sharing))
* cd xampp/htdocs
* git clone https://github.com/Unicen-Tupar/transporte-solidario
* cd transporte-solidario
* composer install
* cd public/js/mustache.js/
* git clone https://github.com/janl/mustache.js.git .
* Ejecutar script transporte.sql en base de datos "transporte"
* Renombrar .env.example -> .env

## Para trabajar en la User Story
* Cambiamos a un nuevo branch para la US que le corresponda a cada uno:

$ git checkout -b us_N

* Trabajamos sobre el branch y se pushea solo el branch nuevo

$ git push origin us_N



## License

The Lumen framework is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)
