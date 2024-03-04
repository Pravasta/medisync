<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hospital extends Model
{
    use HasFactory;
    protected $guarded = ['id'];

    public function doctorSchedules()
    {
        return $this->hasMany(DoctorSchedule::class, 'doctor_id');
    }
}
