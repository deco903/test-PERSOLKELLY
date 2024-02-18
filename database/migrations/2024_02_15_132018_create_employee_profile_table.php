<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employee_profile', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('employee_id');
            $table->foreign('employee_id')->references('id')->on('employee')->onDelete('cascade');
            $table->date('place_of_birth');
            $table->date('date_of_birth');
            $table->enum('gender', ['laki-laki', 'perempuan']);
            $table->boolean('is_married');
            $table->string('prof_pic');
            $table->string('created_by');
            $table->string('updated_by');
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
        Schema::dropIfExists('employee_profile');
        $table->dropForeign(['employee_id']);
    }
};
