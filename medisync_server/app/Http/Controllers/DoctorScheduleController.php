<?php

namespace App\Http\Controllers;

use App\Models\DoctorSchedule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class DoctorScheduleController extends Controller
{
    public function index(Request $request)
    {
        $query = DoctorSchedule::query();

        // Handle query parameters
        if ($request->has('sort_by')) {
            $sortColumn = $request->get('sort_by');
            $sortType = $request->get('sort_type', 'asc');
            $query->orderBy($sortColumn, $sortType);
        }

        $limit = $request->get('limit', 10);
        $schedules = $query->paginate($limit);

        return response()->json($schedules);
    }

    public function show($id)
    {
        $schedule = DoctorSchedule::find($id);

        if (!$schedule) {
            return response()->json(['error' => 'Schedule not found'], 404);
        }

        return response()->json(['data' => $schedule]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'hospital_id' => 'required|exists:hospitals,id',
            'doctor_id' => 'required|exists:doctors,id',
            'schedule_date' => 'required|date',
            'schedule_time' => 'required|string',
            'patient_limit' => 'required|integer',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $schedule = DoctorSchedule::create($request->all());

        return response()->json(['data' => $schedule], 201);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'hospital_id' => 'exists:hospitals,id',
            'doctor_id' => 'exists:doctors,id',
            'schedule_date' => 'date',
            'schedule_time' => 'string',
            'patient_limit' => 'integer',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $schedule = DoctorSchedule::find($id);

        if (!$schedule) {
            return response()->json(['error' => 'Schedule not found'], 404);
        }

        $schedule->update($request->all());

        return response()->json(['data' => $schedule], 200);
    }

    public function destroy($id)
    {
        $schedule = DoctorSchedule::find($id);

        if (!$schedule) {
            return response()->json(['error' => 'Schedule not found'], 404);
        }

        $schedule->delete();

        return response()->json(['message' => 'Schedule deleted successfully'], 200);
    }
}
