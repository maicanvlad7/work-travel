<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('users');
        Schema::defaultStringLength(191);

        Schema::create('users', function (Blueprint $table) {
            $table->id();
            //start of custom attr
            $table->string('name');
            $table->string('role'); //defines the user's role, can either be Manager,Student or Admin -> also have middleware based on this
            $table->string('address');
            $table->date('dob');
            $table->string('phone_nr');
            //end of custom attr
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
}
