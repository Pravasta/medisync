<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Doctor;

class DoctorSeeder extends Seeder
{
    public function run()
    {
        Doctor::create([
            'doctor_name' => 'Dr. John Doe',
            'photo' => 'doctor1.jpg',
            'specialization_id' => rand(1, 5), // Sesuaikan dengan ID dari tabel specializations
            'hospital_id' => rand(1, 3),
            'description'=> "Experienced with a focus on healt patient because we are peaople can strong and healt. Thankyou and Lovee youee :))" ,
            'medical_treatment' => "Terapi fisik, Rehabilitasi, Perawatan Jangka Panjang",
            'practical_experience' => "Pengalaman Klinis. Pengalaman Praktis",
            'educational_history'=> "Gelar Doktor Umum, Universitas Hardvard (2016-2022)",

        ]);

        Doctor::create([
            'doctor_name' => 'Dr. Jane Smith',
            'photo' => 'doctor2.jpg',
            'specialization_id' => rand(1, 5), // Sesuaikan dengan ID dari tabel specializations
            'hospital_id' => rand(1, 3),
            'description'=> "Experienced with a focus on healt patient because we are peaople can strong and healt. Thankyou and Lovee youee :))" ,
            'medical_treatment' => "Terapi fisik, Rehabilitasi, Perawatan Jangka Panjang",
            'practical_experience' => "Pengalaman Klinis. Pengalaman Praktis",
            'educational_history'=> "Gelar Doktor Umum, Universitas Hardvard (2016-2022)",

        ]);

        Doctor::create([
            'doctor_name' => 'Dr. Michael Johnson',
            'photo' => 'doctor3.jpg',
            'specialization_id' => rand(1, 5), // Sesuaikan dengan ID dari tabel specializations
            'hospital_id' => rand(1, 3),
            'description'=> "Experienced with a focus on healt patient because we are peaople can strong and healt. Thankyou and Lovee youee :))" ,
            'medical_treatment' => "Terapi fisik, Rehabilitasi, Perawatan Jangka Panjang",
            'practical_experience' => "Pengalaman Klinis. Pengalaman Praktis",
            'educational_history'=> "Gelar Doktor Umum, Universitas Hardvard (2016-2022)",

        ]);

        Doctor::create([
            'doctor_name' => 'Dr. Sarah Brown',
            'photo' => 'doctor4.jpg',
            'specialization_id' => rand(1, 5), // Sesuaikan dengan ID dari tabel specializations
            'hospital_id' => rand(1, 3),
            'description'=> "Experienced with a focus on healt patient because we are peaople can strong and healt. Thankyou and Lovee youee :))" ,
            'medical_treatment' => "Terapi fisik, Rehabilitasi, Perawatan Jangka Panjang",
            'practical_experience' => "Pengalaman Klinis. Pengalaman Praktis",
            'educational_history'=> "Gelar Doktor Umum, Universitas Hardvard (2016-2022)",

        ]);

        Doctor::create([
            'doctor_name' => 'Dr. Richard Anderson',
            'photo' => 'doctor5.jpg',
            'specialization_id' => rand(1, 5), // Sesuaikan dengan ID dari tabel specializations
            'hospital_id' => rand(1, 3),
            'description'=> "Experienced with a focus on healt patient because we are peaople can strong and healt. Thankyou and Lovee youee :))" ,
            'medical_treatment' => "Terapi fisik, Rehabilitasi, Perawatan Jangka Panjang",
            'practical_experience' => "Pengalaman Klinis. Pengalaman Praktis",
            'educational_history'=> "Gelar Doktor Umum, Universitas Hardvard (2016-2022)",

        ]);

        Doctor::create([
            'doctor_name' => 'Dr. Emily White',
            'photo' => 'doctor6.jpg',
            'specialization_id' => rand(1, 5), // Sesuaikan dengan ID dari tabel specializations
            'hospital_id' => rand(1, 3),
            'description'=> "Experienced with a focus on healt patient because we are peaople can strong and healt. Thankyou and Lovee youee :))" ,
            'medical_treatment' => "Terapi fisik, Rehabilitasi, Perawatan Jangka Panjang",
            'practical_experience' => "Pengalaman Klinis. Pengalaman Praktis",
            'educational_history'=> "Gelar Doktor Umum, Universitas Hardvard (2016-2022)",

        ]);

        Doctor::create([
            'doctor_name' => 'Dr. Christopher Lee',
            'photo' => 'doctor7.jpg',
            'specialization_id' => rand(1, 5), // Sesuaikan dengan ID dari tabel specializations
            'hospital_id' => rand(1, 3),
            'description'=> "Experienced with a focus on healt patient because we are peaople can strong and healt. Thankyou and Lovee youee :))" ,
            'medical_treatment' => "Terapi fisik, Rehabilitasi, Perawatan Jangka Panjang",
            'practical_experience' => "Pengalaman Klinis. Pengalaman Praktis",
            'educational_history'=> "Gelar Doktor Umum, Universitas Hardvard (2016-2022)",

        ]);

        Doctor::create([
            'doctor_name' => 'Dr. Olivia Davis',
            'photo' => 'doctor8.jpg',
            'specialization_id' => rand(1, 5), // Sesuaikan dengan ID dari tabel specializations
            'hospital_id' => rand(1, 3),
            'description'=> "Experienced with a focus on healt patient because we are peaople can strong and healt. Thankyou and Lovee youee :))" ,
            'medical_treatment' => "Terapi fisik, Rehabilitasi, Perawatan Jangka Panjang",
            'practical_experience' => "Pengalaman Klinis. Pengalaman Praktis",
            'educational_history'=> "Gelar Doktor Umum, Universitas Hardvard (2016-2022)",

        ]);

        Doctor::create([
            'doctor_name' => 'Dr. Benjamin Taylor',
            'photo' => 'doctor9.jpg',
            'specialization_id' => rand(1, 5), // Sesuaikan dengan ID dari tabel specializations
            'hospital_id' => rand(1, 3),
            'description'=> "Experienced with a focus on healt patient because we are peaople can strong and healt. Thankyou and Lovee youee :))" ,
            'medical_treatment' => "Terapi fisik, Rehabilitasi, Perawatan Jangka Panjang",
            'practical_experience' => "Pengalaman Klinis. Pengalaman Praktis",
            'educational_history'=> "Gelar Doktor Umum, Universitas Hardvard (2016-2022)",

        ]);

        Doctor::create([
            'doctor_name' => 'Dr. Emma Hall',
            'photo' => 'doctor10.jpg',
            'specialization_id' => rand(1, 5), // Sesuaikan dengan ID dari tabel specializations
            'hospital_id' => rand(1, 3),
            'description'=> "Experienced with a focus on healt patient because we are peaople can strong and healt. Thankyou and Lovee youee :))" ,
            'medical_treatment' => "Terapi fisik, Rehabilitasi, Perawatan Jangka Panjang",
            'practical_experience' => "Pengalaman Klinis. Pengalaman Praktis",
            'educational_history'=> "Gelar Doktor Umum, Universitas Hardvard (2016-2022)",

        ]);
    }
}
