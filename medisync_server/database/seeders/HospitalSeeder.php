<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Hospital;

class HospitalSeeder extends Seeder
{
    public function run()
    {
        // Hapus data existing jika ada
        Hospital::truncate();

        // Tambahkan data dummy
        Hospital::create([
            'photo' => 'hospital1.jpg',
            'hospital_name' => 'Central Hospital',
            'hospital_address' => '123 Main Street',
            'hospital_location_latitude' => 37.7749,
            'hospital_location_longitude' => -122.4194,
            'hospital_phone_number' => '035189701',
            'hospital_whatsapp_number' => '081765897888',
            'hospital_email' => 'demo@gmail.com'
        ]);

        Hospital::create([
            'photo' => 'hospital2.jpg',
            'hospital_name' => 'City Medical Center',
            'hospital_address' => '456 Oak Avenue',
            'hospital_location_latitude' => 40.7128,
            'hospital_location_longitude' => -74.0060,
            'hospital_phone_number' => '045678912',
            'hospital_whatsapp_number' => '081765897889',
            'hospital_email' => 'info@citymedical.com'
        ]);

        Hospital::create([
            'photo' => 'hospital3.jpg',
            'hospital_name' => 'Sunset Clinic',
            'hospital_address' => '789 Pine Street',
            'hospital_location_latitude' => 34.0522,
            'hospital_location_longitude' => -118.2437,
            'hospital_phone_number' => '012345678',
            'hospital_whatsapp_number' => '081765897890',
            'hospital_email' => 'sunsetclinic@example.com'
        ]);

        Hospital::create([
            'photo' => 'hospital4.jpg',
            'hospital_name' => 'Greenfield Medical Center',
            'hospital_address' => '101 Elm Road',
            'hospital_location_latitude' => 41.8781,
            'hospital_location_longitude' => -87.6298,
            'hospital_phone_number' => '0987654321',
            'hospital_whatsapp_number' => '081765897891',
            'hospital_email' => 'info@greenfieldmed.com'
        ]);

        Hospital::create([
            'photo' => 'hospital5.jpg',
            'hospital_name' => 'Harbor Health Services',
            'hospital_address' => '567 Harbor Drive',
            'hospital_location_latitude' => 32.7157,
            'hospital_location_longitude' => -117.1611,
            'hospital_phone_number' => '0543219876',
            'hospital_whatsapp_number' => '081765897892',
            'hospital_email' => 'contact@harborhealth.com'
        ]);

        // Tambahkan data dummy lainnya sesuai kebutuhan
    }
}
