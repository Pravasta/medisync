<?php

namespace App\Http\Controllers;

use App\Models\Doctor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class DoctorController extends Controller
{
    public function index(Request $request)
    {
        $query = Doctor::query();

        // Handle query parameters
        if ($request->has('sort_by')) {
            $sortColumn = $request->get('sort_by');
            $sortType = $request->get('sort_type', 'asc');
            $query->orderBy($sortColumn, $sortType);
        }

        $limit = $request->get('limit', 10);

        // Load the doctorSchedules, hospitals, and specializations relationship
        $doctors = $query->with(['doctorSchedules', 'doctorSchedules.hospital', 'specialization'])->paginate($limit);

        return response()->json($doctors);
    }

    public function show($id)
    {
        $doctor = Doctor::find($id);

        if (!$doctor) {
            return response()->json(['error' => 'Doctor not found'], 404);
        }

        return response()->json(['data' => $doctor]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'doctor_name' => 'required|string',
            'photo' => 'nullable|string',
            'specialization_id' => 'required|exists:specializations,id',
            'hospital_id' => 'required|exists:hospitals,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $doctor = Doctor::create($request->all());

        return response()->json(['data' => $doctor], 201);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'doctor_name' => 'string',
            'photo' => 'nullable|string',
            'specialization_id' => 'exists:specializations,id',
            'hospital_id' => 'exists:hospitals,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $doctor = Doctor::find($id);

        if (!$doctor) {
            return response()->json(['error' => 'Doctor not found'], 404);
        }

        $doctor->update($request->all());

        return response()->json(['data' => $doctor], 200);
    }

    public function destroy($id)
    {
        $doctor = Doctor::find($id);

        if (!$doctor) {
            return response()->json(['error' => 'Doctor not found'], 404);
        }

        $doctor->delete();

        return response()->json(['message' => 'Doctor deleted successfully'], 200);
    }
}
