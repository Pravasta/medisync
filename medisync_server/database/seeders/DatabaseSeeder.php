<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Database\Seeders\DoctorScheduleSeeder;
use Database\Seeders\DoctorSeeder;
use Database\Seeders\HospitalSeeder;
use Database\Seeders\OrdersSeeder;
use Database\Seeders\SpecializationSeeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $obj = new DoctorSeeder();
        $obj->run();
        $obj = new DoctorScheduleSeeder();
        $obj->run();
        $obj = new HospitalSeeder();
        $obj->run();
        $obj = new OrdersSeeder();
        $obj->run();
        $obj = new SpecializationSeeder();
        $obj->run();
    }
}
