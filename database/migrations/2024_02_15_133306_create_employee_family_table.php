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
        Schema::create('employee_family', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('employee_id');
            $table->foreign('employee_id')->references('id')->on('employee')->onDelete('cascade');
            $table->string('name');
            $table->string('identifier');
            $table->string('job');
            $table->date('place_of_birth');
            $table->date('date_of_birth');
            $table->enum('religion', ['islam','katolik','buda','protestan','konghucu']);
            $table->boolean('is_life');
            $table->boolean('is_divorced');
            $table->enum('relation_status', ['suami','istri','anak','anak sambung']);
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
        Schema::dropIfExists('employee_family');
        $table->dropForeign(['employee_id']);
    }
};
