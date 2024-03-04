<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Order;

class OrdersSeeder extends Seeder
{
    public function run()
    {
        // Tambahkan data order sesuai kebutuhan
        Order::create([
            'doctor_id' => 1, // Sesuaikan dengan ID dari tabel doctors
            'user_id' => 1, // Sesuaikan dengan ID dari tabel users
            'schedule_id' => 1, // Sesuaikan dengan ID dari tabel doctor_schedules
            'patient_name' => 'John Doe',
            'patient_dob' => '1990-05-15',
            'patient_gender' => 'male',
            'patient_id_card' => 'A123456789',
            'patient_address' => '123 Main St',
            'patient_phone_number' => '123-456-7890',
            'patient_whatsapp_number' => '123-456-7890',
            'payment_type' => 'Credit Card',
            'payment_transaction_id' => 'ABC123XYZ',
            'payment_order_id' => 'ORDER123',
            'payment_transaction_status' => 'success',
        ]);

        Order::create([
            'doctor_id' => 2, // Sesuaikan dengan ID dari tabel doctors
            'user_id' => 2, // Sesuaikan dengan ID dari tabel users
            'schedule_id' => 2, // Sesuaikan dengan ID dari tabel doctor_schedules
            'patient_name' => 'Jane Smith',
            'patient_dob' => '1985-08-20',
            'patient_gender' => 'female',
            'patient_id_card' => 'B987654321',
            'patient_address' => '456 Oak St',
            'patient_phone_number' => '987-654-3210',
            'patient_whatsapp_number' => '987-654-3210',
            'payment_type' => 'PayPal',
            'payment_transaction_id' => 'XYZ456ABC',
            'payment_order_id' => 'ORDER456',
            'payment_transaction_status' => 'success',
        ]);

        // Tambahkan data order lainnya sesuai kebutuhan
    }
}
