<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();

Route::middleware('auth')->group(function () {
    // Route Dashboard
    Route::get('/dashboard', 'DashboardController@index')->name('dashboard');

    Route::group(['prefix' => 'admin', 'as' => 'admin.', 'namespace' => 'Admin'], function () {
        // Route Permissions
        Route::resource('permissions', 'PermissionController');

        // Route Roles
        Route::resource('roles', 'RolesController');

        // Route Master User
        Route::resource('users', 'UserController');

        // Route Master Cabang
        Route::resource('warehouse', 'WarehouseController');

        // Route Master Barang
        Route::resource('product', 'BarangController');

        // Route Master Service
        Route::resource('service', 'ServiceController');

        // Route Harga Barang Cabang
        Route::get('price-product/{warehouse:id}/create', 'HargaBarangController@create');
        Route::get('price-service/{warehouse:id}/create', 'HargaBarangController@create');
        Route::resource('price-product', 'HargaBarangController');
        Route::resource('price-service', 'HargaBarangController');
    });
});
