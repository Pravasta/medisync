<?php

namespace App\Http\Controllers;

use App\Models\Hospital;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class HospitalController extends Controller
{
    public function index(Request $request)
    {
        $query = Hospital::query();

        // Handle query parameters
        if ($request->has('sort_by')) {
            $sortColumn = $request->get('sort_by');
            $sortType = $request->get('sort_type', 'asc');
            $query->orderBy($sortColumn, $sortType);
        }

        $limit = $request->get('limit', 10);
        $hospitals = $query->paginate($limit);

        return response()->json($hospitals);
    }

    public function show($id)
    {
        $hospital = Hospital::find($id);

        if (!$hospital) {
            return response()->json(['error' => 'Hospital not found'], 404);
        }

        return response()->json(['data' => $hospital]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'photo' => 'nullable|string',
            'hospital_name' => 'required|string',
            'hospital_address' => 'required|string',
            'hospital_location_latitude' => 'required|numeric',
            'hospital_location_longitude' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $hospital = Hospital::create($request->all());

        return response()->json(['data' => $hospital], 201);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'photo' => 'nullable|string',
            'hospital_name' => 'string',
            'hospital_address' => 'string',
            'hospital_location_latitude' => 'numeric',
            'hospital_location_longitude' => 'numeric',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $hospital = Hospital::find($id);

        if (!$hospital) {
            return response()->json(['error' => 'Hospital not found'], 404);
        }

        $hospital->update($request->all());

        return response()->json(['data' => $hospital], 200);
    }

    public function destroy($id)
    {
        $hospital = Hospital::find($id);

        if (!$hospital) {
            return response()->json(['error' => 'Hospital not found'], 404);
        }

        $hospital->delete();

        return response()->json(['message' => 'Hospital deleted successfully'], 200);
    }
}
