<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRincianPembayaransTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rincian_pembayarans', function (Blueprint $table) {
            $table->id();
            $table->foreignId('booking_id');
            $table->foreignId('kasir_id');
            $table->foreignId('payment_id');
            $table->string('tanggal_pembayaran');
            $table->integer('nominal');
            $table->integer('is_active');
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
        Schema::dropIfExists('rincian_pembayarans');
    }
}
