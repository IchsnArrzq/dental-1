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

Route::middleware('auth',)->group(function () {
    // Route Dashboard
    Route::get('/dashboard', 'DashboardController@index')->name('dashboard');
    Route::get('/profile', 'DashboardController@profile')->name('profile');

    Route::group(['prefix' => 'admin', 'as' => 'admin.', 'namespace' => 'Admin'], function () {
        // Route Permissions
        Route::resource('permissions', 'PermissionController');

        // Route Roles
        Route::resource('roles', 'RolesController');

        // Route Master User
        Route::resource('users', 'UserController');

        // Route Master Cabang
        Route::get('cabang/{cabang:id}/ruangan', 'CabangController@ruangan');
        Route::resource('cabang', 'CabangController');

        // Route Master Barang
        Route::resource('product', 'BarangController');

        // Route Master Service
        Route::resource('service', 'ServiceController');

        // Route Harga Barang Cabang
        Route::get('price-service/{cabang:id}/create', 'HargaBarangController@create');
        Route::get('price-service/{hargaProdukCabang:id}/edit', 'HargaBarangController@edit');
        Route::get('price-product/{cabang:id}/create', 'HargaBarangController@create');
        Route::get('price-product/{hargaProdukCabang:id}/edit', 'HargaBarangController@edit');

        Route::post('price/store', 'HargaBarangController@store');
        Route::patch('price/{hargaProdukCabang:id}/update', 'HargaBarangController@update');
        Route::delete('price/{hargaProdukCabang:id}/destroy', 'HargaBarangController@destroy');

        // Route Master Patient
        Route::get('pasien/simbol/{warna}', 'PatientController@simbol')->name('pasien.simbol');
        Route::get('pasien/{customer:id}/odontogram', 'PatientController@odontogram')->name('pasien.odontogram');
        Route::get('pasien/{customer:id}/cekfisik', 'PatientController@cekfisik')->name('pasien.cekfisik');
        Route::get('pasien/cetakodontogram/{customer:id}', 'PatientController@cetakodontogram')->name('pasien.cetakodonto');
        Route::get('pasien/cetakriwayat/{customer:id}', 'PatientController@cetakriwayat')->name('pasien.cetakriwayat');
        Route::post('pasien/{customer:id}/storefisik', 'PatientController@storefisik')->name('pasien.storefisik');
        Route::resource('pasien', 'PatientController');


        // Route Master Payments
        Route::resource('payments', 'PaymentController');

        // Route Master simbol
        Route::resource('simbol', 'SimbolOdontogramController');

        // Route Master Status Pasien
        Route::resource('status', 'StatusPasienController');

        // Route Master Voucher
        Route::post('voucher/kode', 'VoucherController@kode')->name("voucher.kode");
        Route::resource('voucher', 'VoucherController');

        // Route Master Komisi
        Route::resource('komisi', 'KomisiController');

        // Route Master Dokter
        Route::resource('dokter', 'DokterController');

        // Route Master Ruangan
        Route::get('ruangan/{cabang:id}/create', 'RuanganController@create');
        Route::resource('ruangan', 'RuanganController');

        // Route Appointment
        Route::post('appointments/voucher', 'AppointmentController@voucher')->name('appointments.voucher');
        Route::post('appointments/bayar', 'AppointmentController@bayar')->name('appointments.bayar');
        Route::resource('appointments', 'AppointmentController');

        // Route Report
        Route::get('report/pasien', 'ReportController@pasien')->name('report.pasien');
        Route::post('report/pasien', 'ReportController@pasien')->name('report.pasien');
        // Route::get('report/pasien/export/{cabang:id}', 'ReportController@pasienexport')->name('pasien.export');
        Route::get('report/appoinment', 'ReportController@appoinment')->name('report.appoinment');
        Route::post('report/appointment', 'ReportController@appoinment')->name('report.appointment');
        // Route::get('report/appoinment/export/{cabang:id}', 'ReportController@appoinmentreport')->name('appoinment.export');
        Route::get('report/payment', 'ReportController@payment')->name('report.payment');
        Route::post('report/payment', 'ReportController@payment')->name('report.payment');
        // Route::get('report/payment/export/{payment:id}', 'ReportController@paymentreport')->name('payment.export');
        Route::get('report/komisi', 'ReportController@komisi')->name('report.komisi');
        Route::post('report/komisi', 'ReportController@komisi')->name('report.komisi');
        // Route::get('report/komisi/export/{role:id}', 'ReportController@komisireport')->name('komisi.export');

        //Route Master Holidays
        Route::resource('holidays', 'HolidaysController');
        Route::get('holidays/datatables', 'HolidaysController@datatables')->name('holidays.datatables');
        //Route Master Attendance
        Route::get('/attendance/update_user', 'AttendanceController@update_user')->name('attendance.update_user');
        Route::get('/attendance/search', 'AttendanceController@search')->name('attendance.search');
        Route::resource('attendance', 'AttendanceController');
    });

    Route::prefix('dokter')->name('dokter.')->namespace('Dokter')->group(function () {
        Route::get('/', function () {
            return redirect()->route('dashboard');
        })->name('dashboard');

        Route::resource('/appointments', 'AppointmentsController');
        Route::resource('/profile', 'ProfileController');
        Route::get('/ajax/pasien', 'ServiceController@AjaxPasien');
        Route::post('/ajax/pasien/post', 'ServiceController@AjaxPasienPost');
        Route::get('/ajax/update/{id}/{value}/{id_booking}', 'ServiceController@ajax');
        Route::get('dokter/show/{id}', 'ServiceController@show')->name('show');
        Route::get('pasien', 'ServiceController@pasien')->name('pasien');
    });

    Route::prefix('marketing')->name('marketing.')->namespace('Marketing')->group(function () {
        Route::get('/', function () {
            return redirect()->route('dashboard');
        })->name('dashboard');
        Route::resource('/appointments', 'AppointmentsController');
        Route::resource('/patient', 'PatientController');
        Route::resource('/doctor', 'DoctorController');
        Route::resource('/pricelist', 'PricelistController');
        Route::resource('/profile', 'ProfileController');
        Route::prefix('/service')->name('service.')->group(function () {
            Route::get('/appointments/filter', 'ServiceController@AppointmentsFilter')->name('appointments.filter');
            Route::post('/appointments/books', 'ServiceController@AppointmentsBook')->name('appointments.book');
        });
        Route::get('/jadwal/{id}/{dokter}', 'AjaxController@GetBook');
        Route::get('/jadwal/now/{id}/{dokter}', 'AjaxController@GetBookNow');
        Route::get('/resource/{id}', 'AjaxController@GetProduct');
        Route::get('/barang', 'AjaxController@GetProducts');
        Route::get('/where/customer', 'AjaxController@WhereCustomer');
        Route::get('/where/product', 'AjaxController@WhereProduct');
        Route::get('/cabang', 'AjaxController@GetCabang');
        Route::get('/pasien/{id}', 'AjaxController@GetCustomer');
        Route::get('/time/{jadwal}/{time}/{waktu_mulai}', 'AjaxController@GetTime');
        Route::get('/show/{id}', 'AjaxController@show')->name('show');
        Route::get('/datatable/appointments', 'AjaxController@DataTableAppointment');
    });

    // Route Resepsionis
    Route::prefix('resepsionis')->namespace('Resepsionis')->as('resepsionis.')->group(function () {
        // Route Appointment
        Route::post('appointments/update/perawat', 'AppointmentController@updateperawat')->name('appointments.updateperawat');
        Route::post('appointments/update/ob', 'AppointmentController@updateob')->name('appointments.updateob');
        Route::post('appointments/status', 'AppointmentController@status')->name('appointments.status');
        Route::post('appointments/voucher', 'AppointmentController@voucher')->name('appointments.voucher');
        Route::post('appointments/bayar', 'AppointmentController@bayar')->name('appointments.bayar');
        Route::resource('appointments', 'AppointmentController');

        // Route Dokter
        Route::resource('dokter', 'DokterController');

        // Route Pasien
        Route::get('/ajax/pasien', 'PasienController@ajaxPasien');
        Route::resource('pasien', 'PasienController');
    });

    // Route Supervisor
    Route::prefix('supervisor')->namespace('Supervisor')->as('supervisor.')->group(function () {
        // Route Appointment
        Route::get('appointments/ajax', 'AppointmentController@ajaxAppointment');
        Route::post('appointments/deleterincian', 'AppointmentController@deleterincian')->name('appointments.deleterincian');
        Route::resource('appointments', 'AppointmentController');
    });



    // Route Rekam Medis
    Route::resource('rekam-medis', 'RekamMedisController');

    // Route Ket Odontogram
    Route::resource('ketodonto', 'KetOdontogramController');
});
