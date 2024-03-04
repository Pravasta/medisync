<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Specialization;

class SpecializationSeeder extends Seeder
{
    public function run()
    {
        Specialization::create(['specializations_name' => 'Cardiology']);
        Specialization::create(['specializations_name' => 'Dermatology']);
        Specialization::create(['specializations_name' => 'Orthopedics']);
        Specialization::create(['specializations_name' => 'Neurology']);
        Specialization::create(['specializations_name' => 'Ophthalmology']);
        Specialization::create(['specializations_name' => 'Pediatrics']);
        Specialization::create(['specializations_name' => 'Gastroenterology']);
        Specialization::create(['specializations_name' => 'Endocrinology']);
        Specialization::create(['specializations_name' => 'Rheumatology']);
        Specialization::create(['specializations_name' => 'Urology']);
    }
}
