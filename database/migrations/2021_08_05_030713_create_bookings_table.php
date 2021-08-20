<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->id();
            $table->string('no_booking');
            $table->foreignId('marketing_id');
            $table->foreignId('dokter_id');
            $table->foreignId('resepsionis_id');
            $table->foreignId('ob_id');
            $table->foreignId('perawat_id');
            $table->foreignId('cabang_id');
            $table->foreignId('customer_id');
            $table->foreignId('tindakan_id');
            $table->integer('status_pembayaran');
            $table->string('tanggal_status');
            $table->string('jam_status');
            $table->string('jam_selesai');
            $table->string('is_active');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bookings');
    }
}
