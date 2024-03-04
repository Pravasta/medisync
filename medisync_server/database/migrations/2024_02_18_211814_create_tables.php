<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::dropIfExists('orders');
        Schema::dropIfExists('doctor_schedules');
        Schema::dropIfExists('users');
        Schema::dropIfExists('doctors');
        Schema::dropIfExists('hospitals');
        Schema::dropIfExists('specializations');

        // Create specializations table
        Schema::create('specializations', function (Blueprint $table) {
            $table->id();
            $table->string('specializations_name');
            $table->timestamps();
        });

        // Create hospitals table
        Schema::create('hospitals', function (Blueprint $table) {
            $table->id();
            $table->string('photo')->nullable();
            $table->string('hospital_name');
            $table->string('hospital_address');
            $table->double('hospital_location_latitude')->nullable();
            $table->double('hospital_location_longitude')->nullable();
            $table->string('hospital_phone_number');
            $table->string('hospital_whatsapp_number');
            $table->string('hospital_email');
            $table->timestamps();
        });

        // Create doctors table
        Schema::create('doctors', function (Blueprint $table) {
            $table->id();
            $table->string('doctor_name');
            $table->string('photo')->nullable();
            $table->string('description');
            $table->integer('specialization_id');
            $table->integer('hospital_id');
            $table->string('medical_treatment');
            $table->string('practical_experience');
            $table->string('educational_history');
            $table->timestamps();
            
            // $table->foreign('specialization_id')->references('id')->on('specializations');
            // $table->foreign('hospital_id')->references('id')->on('hospitals');
        });

        // Create users table
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('photo')->nullable();
            $table->string('email')->unique();
            $table->string('address')->nullable();
            $table->string('phone_number')->nullable();
            $table->string('whatsapp_number')->nullable();
            $table->timestamps();
        });

        // Create doctor_schedules table
        Schema::create('doctor_schedules', function (Blueprint $table) {
            $table->id();
            $table->integer('hospital_id');
            $table->integer('doctor_id');
            $table->string('day');
            $table->string('start_time');
            $table->string('end_time');
            $table->integer('consultation_fee');
            $table->integer('patient_limit');
            $table->timestamps();

            // $table->foreign('hospital_id')->references('id')->on('hospitals');
            // $table->foreign('doctor_id')->references('id')->on('doctors');
        });

        // Create orders table
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->integer('doctor_id');
            $table->integer('user_id');
            $table->integer('schedule_id');
            $table->string('patient_name');
            $table->date('patient_dob')->nullable();
            $table->string('patient_gender')->nullable();
            $table->string('patient_id_card')->nullable();
            $table->string('patient_address')->nullable();
            $table->string('patient_phone_number')->nullable();
            $table->string('patient_whatsapp_number')->nullable();
            $table->string('payment_type');
            $table->string('payment_transaction_id');
            $table->string('payment_order_id');
            $table->string('payment_transaction_status');
            $table->text('payment_callback_detail')->nullable();
            $table->timestamps();

            // $table->foreign('doctor_id')->references('id')->on('doctors');
            // $table->foreign('user_id')->references('id')->on('users');
            // $table->foreign('schedule_id')->references('id')->on('doctor_schedules');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tables');
    }
};
