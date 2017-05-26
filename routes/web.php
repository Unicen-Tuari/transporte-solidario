<?php
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/
/* Site endpoints */
$app->get('{type:\w*}', [
    'as' => 'app',function ($type = '') use ($app) {
    return view('singlepageapp');
}]);
/*$app->get('/usuarios',function(){ return redirect()->route('app');});*/
$app->post('/auth/login', 'AuthController@postLogin');
/* API Endpoints*/


$app->get('api/v1/navigation', 'NavigationController@menu');

//Testing
$app->get('api/v1/viajes/realizados/{orden}/{estado}','ViajesController@getViajesRealizados');
$app->get('api/v1/viajes/{id}', 'ViajesController@getViaje');
$app->post('api/v1/register', 'UserController@setRegister');

$app->group(['prefix' => 'api/v1/',
    'middleware' => 'auth'], function () use ($app) {

      $app->get('viajes','ViajesController@getViajes');
      $app->post('viajes/ofrecerme','ViajesController@ofrecermeAlViaje');
      $app->get('users', 'UserController@getUsers');
      $app->get('users/{id}', 'UserController@getUser');
      $app->get('perfil', 'UserController@getLoggedInUser');
      $app->post('viajes','ViajesController@addViaje');
      $app->post('users/{id}', 'UserController@setRol');
      $app->post('perfil/img/{id}', 'UserController@saveImg');
});
