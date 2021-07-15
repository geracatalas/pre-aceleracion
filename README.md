# PRE-ACELERACIÓN RUBY EN ALKEMY

## Versiones

* Ruby version: 3.0.0p0 (2020-12-25 revision 95aff21468)
* Rails version: 6.1.4


### Cosas que me faltaron por hacer

* Hacer que un personaje pueda pertenecer a mas de una pelicula/serie
* Hacer que una pelicula pueda tener más de un género
* Hacer el envío de un correo de bienvenida a los usuarios registrados
* Documentación
* Crear test automáticos (_Los endpoints funcionan_).

-----

## Auth Endpoints
* Register (POST):  /auth
* Login (POST):     /auth/sign_in

-----

## Characters Endpoints
* Ver todos (GET):                          /api/v1/characters
* Filtrar por nombre (GET):                 /api/v1/characters?name=_nombre_
* Filtrar por edad (GET):                   /api/v1/characters?age=_edad_
* Filtrar por peliculas/series (GET):       /api/v1/characters?movies=_idMovie_
* Ver detalles de un personaje (GET):       /api/v1/characters/_id_
* Crear un personaje (POST):                /api/v1/characters
* Actualizar un personaje (PUT / PATCH):    /api/v1/characters/_id_
* Eliminar un personaje (DELETE):           /api/v1/characters/_id_

-----

## Movies/Series Endpoints
* Ver todos (GET):                                  /api/v1/movies
* Filtrar por nombre (GET):                         /api/v1/movies?name=_título_
* Filtrar por género (GET):                         /api/v1/movies?genre=_idGenero_
* Ordenar por año de lanzamiento (GET):             /api/v1/movies?order=_ASC/DESC_
* Ver detalles de una pelicula/serie (GET):         /api/v1/movies/_id_
* Crear una pelicula/serie (POST):                  /api/v1/movies
* Actualizar una pelicula/serie (PUT / PATCH):      /api/v1/movies/_id_
* Eliminar una pelicula/serie (DELETE):             /api/v1/movies/_id_

-----