<?php

namespace App\Http\Controllers;

use App\Models\Specialization;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SpecializationController extends Controller
{
    public function index(Request $request)
    {
        $query = Specialization::query();

        // Handle query parameters
        if ($request->has('sort_by')) {
            $sortColumn = $request->get('sort_by');
            $sortType = $request->get('sort_type', 'asc');
            $query->orderBy($sortColumn, $sortType);
        }

        $limit = $request->get('limit', 10);
        $specializations = $query->paginate($limit);

        return response()->json($specializations);
    }

    public function show($id)
    {
        $specialization = Specialization::find($id);

        if (!$specialization) {
            return response()->json(['error' => 'Specialization not found'], 404);
        }

        return response()->json(['data' => $specialization]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'specializations_name' => 'required|string|unique:specializations',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $specialization = Specialization::create($request->all());

        return response()->json(['data' => $specialization], 201);
    }

    // Implement update and destroy methods as needed
}
