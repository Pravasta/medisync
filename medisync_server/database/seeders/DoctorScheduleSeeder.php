<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\DoctorSchedule;

class DoctorScheduleSeeder extends Seeder
{
    public function run()
    {

        $doctors = \App\Models\Doctor::all();
        foreach($doctors as $doctor) {
            $dayOfWeek = ['Monday', "Tuesday", "Wednesday", "Thursday","Friday", "Saturday", "Sunday"];
            $randomDay = $dayOfWeek[array_rand($dayOfWeek)];

            $scheduleData = [
                [
                    'hospital_id' => 1, // Sesuaikan dengan ID dari tabel hospitals
                    'doctor_id' => $doctor->id, // Sesuaikan dengan ID dari tabel doctors
                    'day' => $randomDay,
                    'start_time' => '10:00',
                    'end_time' => '12:00',
                    'consultation_fee'=> 150000,
                    'patient_limit' => 5,
                ],
                [
                    'hospital_id' => 2, // Sesuaikan dengan ID dari tabel hospitals
                    'doctor_id' => $doctor->id, // Sesuaikan dengan ID dari tabel doctors
                    'day' => $randomDay,
                    'start_time' => '15:00',
                    'end_time' => '17:00',
                    'consultation_fee'=> 150000,
                    'patient_limit' => 5,
                ],
                [
                    'hospital_id' => 3, 
                    'doctor_id' => $doctor->id, 
                    'day' => $randomDay,
                    'start_time' => '20:00',
                    'end_time' => '21:00',
                    'consultation_fee'=> 150000,
                    'patient_limit' => 5,
                ],
                [
                    'hospital_id' => 3, 
                    'doctor_id' => $doctor->id, 
                    'day' => $randomDay,
                    'start_time' => '04:00',
                    'end_time' => '06:00',
                    'consultation_fee'=> 150000,
                    'patient_limit' => 5,
                ],
                [
                    'hospital_id' => 3, 
                    'doctor_id' => $doctor->id, 
                    'day' => $randomDay,
                    'start_time' => '12:30',
                    'end_time' => '14:30',
                    'consultation_fee'=> 150000,
                    'patient_limit' => 5,
                ],
                [
                    'hospital_id' => 3, 
                    'doctor_id' => $doctor->id, 
                    'day' => $randomDay,
                    'start_time' => '23:00',
                    'end_time' => '24:00',
                    'consultation_fee'=> 150000,
                    'patient_limit' => 5,
                ],
                [
                    'hospital_id' => 3, 
                    'doctor_id' => $doctor->id, 
                    'day' => $randomDay,
                    'start_time' => '02:00',
                    'end_time' => '04:00',
                    'consultation_fee'=> 150000,
                    'patient_limit' => 5,
                ],
                [
                    'hospital_id' => 3, 
                    'doctor_id' => $doctor->id, 
                    'day' => "Wednesday",
                    'start_time' => '02:00',
                    'end_time' => '04:00',
                    'consultation_fee'=> 150000,
                    'patient_limit' => 5,
                ],
            ];

            foreach($scheduleData as $data){
                DoctorSchedule::create($data);
            }
        }
    }
}
