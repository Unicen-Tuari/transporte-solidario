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


/* API Endpoints*/

$app->get('api/v1/navigation[/{role}]', 'NavigationController@menu');
//Testing
$app->get('api/v1/viajes','ViajesController@getViajes');
$app->get('api/v1/viajes/{id}', 'ViajesController@getViaje');
$app->post('api/v1/viajes','ViajesController@addViaje');

$app->get('api/v1/users', 'UserController@getUsers');
$app->get('api/v1/users/{id}', 'UserController@getUser');
