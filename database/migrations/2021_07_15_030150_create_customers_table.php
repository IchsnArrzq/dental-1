<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id');
            $table->foreignId('cabang_id');
            $table->string('nama');
            $table->string('no_telp', 15);
            $table->string('email');
            $table->string('ttl');
            $table->enum('jk', ['Laki-Laki', 'Perempuan']);
            $table->string('suku');
            $table->string('pekerjaan');
            $table->string('pict');
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
        Schema::dropIfExists('customers');
    }
}
