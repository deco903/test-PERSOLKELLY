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
        Schema::create('education', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('employee_id');
            $table->foreign('employee_id')->references('id')->on('employee')->onDelete('cascade');
            $table->string('name');
            $table->enum('level', ['tk', 'sd','sma','strata-1','strata-2','doktor','profesor']);
            $table->string('description');
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
        Schema::dropIfExists('education');
        $table->dropForeign(['employee_id']);
    }
};
